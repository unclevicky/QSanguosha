#include "skill.h"
#include "engine.h"
#include "player.h"
#include "room.h"
#include "client.h"
#include "standard.h"
#include "scenario.h"

#include <QFile>

Skill::Skill(const QString &name, Frequency frequency)
    :frequency(frequency), default_choice("no")
{
    static QChar lord_symbol('$');

    if(name.endsWith(lord_symbol)){
        QString copy = name;
        copy.remove(lord_symbol);
        setObjectName(copy);
        lord_skill = true;
    }else{
        setObjectName(name);
        lord_skill = false;
    }
}

bool Skill::isLordSkill() const{
    return lord_skill;
}

QString Skill::getDescription() const{
    return Sanguosha->translate(":" + objectName());
}

QString Skill::getText() const{
    QString skill_name = Sanguosha->translate(objectName());

    switch(frequency){
    case Skill::NotFrequent:
    case Skill::Frequent: break;
    case Skill::Limited: skill_name.append(tr(" [Limited]")); break;
    case Skill::Compulsory: skill_name.append(tr(" [Compulsory]")); break;
    case Skill::Wake: skill_name.append(tr(" [Wake]")); break;
    }

    return skill_name;
}

bool Skill::isVisible() const{
    return ! objectName().startsWith("#");
}

QString Skill::getDefaultChoice(ServerPlayer *) const{
    return default_choice;
}

int Skill::getEffectIndex(ServerPlayer *, const Card *) const{
    return -1;
}

void Skill::initMediaSource(){
    sources.clear();

    if(parent()){
        int i;
        for(i=1; ;i++){
            QString effect_file = QString("audio/skill/%1%2.ogg").arg(objectName()).arg(i);
            if(QFile::exists(effect_file))
                sources << effect_file;
            else
                break;
        }

        if(sources.isEmpty()){
            QString effect_file = QString("audio/skill/%1.ogg").arg(objectName());
            if(QFile::exists(effect_file))
                sources << effect_file;
        }
    }
}

void Skill::playEffect(int index) const{
    if(!sources.isEmpty()){
        if(index == -1)
            index = qrand() % sources.length();
        else
            index--;

        // check length
        QString filename;
        if(index >= 0 && index < sources.length())
            filename = sources.at(index);
        else
            filename = sources.first();

        Sanguosha->playEffect(filename);
        if(ClientInstance)
            ClientInstance->setLines(filename);
    }
}

void Skill::setFlag(ServerPlayer *player) const{
    player->getRoom()->setPlayerFlag(player, objectName());
}

void Skill::unsetFlag(ServerPlayer *player) const{
    player->getRoom()->setPlayerFlag(player, "-" + objectName());
}

Skill::Frequency Skill::getFrequency() const{
    return frequency;
}

QStringList Skill::getSources() const{
    return sources;
}

QDialog *Skill::getDialog() const{
    return NULL;
}

ViewAsSkill::ViewAsSkill(const QString &name)
    :Skill(name)
{

}

bool ViewAsSkill::isAvailable() const{
    switch(ClientInstance->getStatus()){
    case Client::Playing: return isEnabledAtPlay(Self);
    case Client::Responsing: return isEnabledAtResponse(Self, ClientInstance->getPattern());
    default:
        return false;
    }
}

bool ViewAsSkill::isEnabledAtPlay(const Player *) const{
    return true;
}

bool ViewAsSkill::isEnabledAtResponse(const Player *, const QString &) const{
    return false;
}

ZeroCardViewAsSkill::ZeroCardViewAsSkill(const QString &name)
    :ViewAsSkill(name)
{

}

const Card *ZeroCardViewAsSkill::viewAs(const QList<CardItem *> &cards) const{
    if(cards.isEmpty())
        return viewAs();
    else
        return NULL;
}

bool ZeroCardViewAsSkill::viewFilter(const QList<CardItem *> &, const CardItem *) const{
    return false;
}

OneCardViewAsSkill::OneCardViewAsSkill(const QString &name)
    :ViewAsSkill(name)
{

}

bool OneCardViewAsSkill::viewFilter(const QList<CardItem *> &selected, const CardItem *to_select) const{
    return selected.isEmpty() && viewFilter(to_select);
}

const Card *OneCardViewAsSkill::viewAs(const QList<CardItem *> &cards) const{
    if(cards.length() != 1)
        return NULL;
    else
        return viewAs(cards.first());
}

FilterSkill::FilterSkill(const QString &name)
    :OneCardViewAsSkill(name)
{
    frequency = Compulsory;
}

TriggerSkill::TriggerSkill(const QString &name)
    :Skill(name), view_as_skill(NULL)
{

}

const ViewAsSkill *TriggerSkill::getViewAsSkill() const{
    return view_as_skill;
}

QList<TriggerEvent> TriggerSkill::getTriggerEvents() const{
    return events;
}

int TriggerSkill::getPriority() const{
    switch(frequency){
    case Compulsory:
    case Wake: return 2;
    default:
        return 1;
    }
}

bool TriggerSkill::triggerable(const ServerPlayer *target) const{
    return target->isAlive() && target->hasSkill(objectName());
}

ScenarioRule::ScenarioRule(Scenario *scenario)
    :TriggerSkill(scenario->objectName())
{
    setParent(scenario);
}

int ScenarioRule::getPriority() const{
    return 3;
}

bool ScenarioRule::triggerable(const ServerPlayer *target) const{
    return true;
}

MasochismSkill::MasochismSkill(const QString &name)
    :TriggerSkill(name)
{
    events << Damaged;
}

int MasochismSkill::getPriority() const{
    return -1;
}

bool MasochismSkill::trigger(TriggerEvent, ServerPlayer *player, QVariant &data) const{
    DamageStruct damage = data.value<DamageStruct>();

    if(player->isAlive())
        onDamaged(player, damage);

    return false;
}

PhaseChangeSkill::PhaseChangeSkill(const QString &name)
    :TriggerSkill(name)
{
    events << PhaseChange;
}

bool PhaseChangeSkill::trigger(TriggerEvent, ServerPlayer *player, QVariant &) const{
    bool skipped = onPhaseChange(player);
    if(skipped)
        player->skip(player->getPhase());

    return skipped;
}

DrawCardsSkill::DrawCardsSkill(const QString &name)
    :TriggerSkill(name)
{
    events << DrawNCards;
}

bool DrawCardsSkill::trigger(TriggerEvent event, ServerPlayer *player, QVariant &data) const{
    int n = data.toInt();
    data = getDrawNum(player, n);
    return false;
}

SlashBuffSkill::SlashBuffSkill(const QString &name)
    :TriggerSkill(name)
{
    events << SlashProceed;
}

bool SlashBuffSkill::trigger(TriggerEvent, ServerPlayer *player, QVariant &data) const{
    if(data.canConvert<SlashEffectStruct>()){
        SlashEffectStruct effect = data.value<SlashEffectStruct>();

        if(player->isAlive())
            return buff(effect);
    }

    return false;
}

GameStartSkill::GameStartSkill(const QString &name)
    :TriggerSkill(name)
{
    events << GameStart;
}

bool GameStartSkill::trigger(TriggerEvent, ServerPlayer *player, QVariant &) const{
    onGameStart(player);
    return false;
}

ProhibitSkill::ProhibitSkill(const QString &name)
    :Skill(name, Skill::Compulsory)
{
}

bool ProhibitSkill::isGlobal() const
{
    return false;
}

DistanceSkill::DistanceSkill(const QString &name)
    :Skill(name, Skill::Compulsory)
{

}

WeaponSkill::WeaponSkill(const QString &name)
    :TriggerSkill(name)
{
}

bool WeaponSkill::triggerable(const ServerPlayer *target) const{
    return target->hasWeapon(objectName());
}

ArmorSkill::ArmorSkill(const QString &name)
    :TriggerSkill(name)
{

}

bool ArmorSkill::triggerable(const ServerPlayer *target) const{
    return target->hasArmorEffect(objectName()) && target->getArmor()->getSkill() == this;
}

MarkAssignSkill::MarkAssignSkill(const QString &mark, int n)
    :GameStartSkill("#" + mark), n(n)
{
}

void MarkAssignSkill::onGameStart(ServerPlayer *player) const{
    QString mark_name = objectName();
    mark_name.remove("#");
    player->gainMark(mark_name, n);
}

DetacherSkill::DetacherSkill(const QString &name)
    :TriggerSkill("#" + name + "_detacher")
{
    events << PhaseChange;
    frequency = Compulsory;
}

bool DetacherSkill::trigger(TriggerEvent event, ServerPlayer *player, QVariant &data) const
{
    if(!validPhaseChange(player,data))return false;
    DetacherSkill::Detach(player,this);

    return false;
}

void DetacherSkill::Detach(ServerPlayer *player, const DetacherSkill *skill)
{
    bool broken = player->getRoom()->getThread()->trigger(ConstraintLose,player);
    if(broken)return;

    QString name = skill->objectName();
    name.replace("_detacher","_constraint");
    name.replace("#","");

    LogMessage log;
    log.type = "#LoseConstraint";
    log.from = player;
    log.arg  = name;

    player->getRoom()->sendLog(log);

    player->getRoom()->detachSkillFromPlayer(player,name);
    player->getRoom()->detachSkillFromPlayer(player,skill->objectName());

    player->getRoom()->setPlayerMark(player,"Chain",player->getMark("Chain")-1);
    player->setChained(player->getMark("Chain")>0);
    player->getRoom()->broadcastProperty(player,"chained");
}

bool DetacherSkill::validPhaseChange(ServerPlayer *player, QVariant &data) const
{
    return player->getPhase() == Player::NotActive;
}

ConstraintSkill::ConstraintSkill(const QString &name)
    :TriggerSkill(name + "_constraint")
{
    frequency = Compulsory;
}