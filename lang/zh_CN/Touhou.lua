return
{
	["touhou"] ="东方",
	["combat"] ="战斗牌",
	["MaxMP"]= "灵力上限",

	["switchmode"] = "切换模式",
	[":switchmode"] = "出牌阶段，你可以在高速与低速模式间切换，并结束出牌阶段。",
	["turn_combo"] = "连携",
	["#TurnComboJudge"] = "%from 进行连携判定, 成功条件是点数不大于 %arg",
	["#TurnComboStart"] = "%from 开始了连携回合",
	
	["#AnnounceAttack"]="%from 对 %to 进行攻击",
	["#chosenBlock"]   ="%from 打出了防御牌",
	["$revealResult"]  ="%from 的战斗牌是 %card",
	["blockCard"]      ="请打出一张防御牌",
	["ex-spell-barrage"]="%src 使用了【EX符卡】，请打出一张【弹幕】来响应",
	["dannatu-barrage"] ="%src 向您弹压，您需要打出一张【弹幕】",
	["full-scre-strike"]="%src 使用了【全屏符卡】，请打出一张【灵击】或【符咒】来响应",
	["#AttackerWin"] = "%from 击败了 %to",
	["#DefenderWin"] = "%to 防御住了 %from ",
	
	["#increasedMp"]    ="%from 回复了 %arg 点灵力",
	["#decreasedMp"]    ="%from 损失了 %arg 点灵力",
	
	["#SetConstraint"]  ="%from 给 %arg 施加了束缚",
	["#LoseConstraint"] ="%from 的束缚 %arg 失去作用" ,

	["$JileiA"] = "%from 的 %card 被冻结",
	["$JileiTemp"] = "%from 的 %card 被暂时冻结",
	
	["barrage"]="弹幕",
	[":barrage"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【弹幕】对目标角色造成1点伤害\
防御效果：抵消【符咒】或点数相同及更小的【弹幕】的效果",
	
	["strike"]="灵击",
	[":strike"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【灵击】对目标角色造成1点灵力损失并返回手牌暂时冻结\
防御效果：抵消【弹幕】或点数相同及更小的【灵击】的效果并返回手牌暂时冻结",
	
	["rune"]="符咒",
	[":rune"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【符咒】对目标角色造成1点灵力损失与1点伤害\
防御效果：抵消【灵击】或点数相同及更小的【符咒】的效果，并对来源造成1点灵力损失与1点伤害",
	
	["dannatu"]="弹压",
	[":dannatu"]="出牌时机：出牌阶段\
使用目标：除你以外，任意一名角色\
作用效果：由目标角色先开始，你和他（她）轮流打出一张【弹幕】，【弹压】对首先不出【弹幕】的一方造成1点伤害；另一方成为此伤害的来源", 
	["ex_spell"]="EX符卡",
	[":ex_spell"]= "出牌时机：1、出牌阶段。2、你处于濒死状态时\
使用目标：1、除你以外的所有角色。2、你\
作用效果：1、按行动顺序结算，除非目标角色打出1张【弹幕】，否则该角色受到【EX符卡】对其造成的1点伤害。2、你的体力回复至1点", 
	["fullscrean_barrage"]="全屏弹幕",
	[":fullscrean_barrage"]= "出牌时机：1、出牌阶段。2、你处于濒死状态时\
使用目标：1、除你以外的所有角色。2、你\
作用效果：1、按行动顺序结算，除非目标角色打出1张【灵击】或【符咒】，否则该角色受到【全屏弹幕】对其造成的1点伤害。2、你的体力回复至1点", 
	["surprise"] = "惊吓",
	[":surprise"]= "出牌时机：出牌阶段\
使用目标：除你以外，任意一名有手牌的角色\
作用效果：查看一名玩家的手牌，然后你可以选择其中一张展示并冻结（该玩家无法打出、使用或弃置该牌直到其回合结束）",
	["nice_guy_card"]="好人卡",
	[":nice_guy_card"]="此牌不可主动使用。此牌被弃置时，你摸一张牌。",
	["#NiceGuy"] = "%from 的【好人卡】效果被触发，%from 将摸一张牌",
	
	["yukkuri"] = "油库里",
	[":yukkuri"] = "装备时，你与其他玩家计算距离时，始终-1。你可以在出牌阶段将装备区的此牌弃置，视为对任意玩家使用了一张【弹压】且不可被取消。此技能无法在装备此牌的回合使用。",
	
	["pants"]   = "少女的胖次",
	[":pants"]   = "装备时，你与其他玩家计算距离时，始终-1。装备此牌时你的灵力与灵力上限+1，卸下此牌时你的灵力上限-1。",
	
	["broomstick"]="飞行扫帚",
	[":broomstick"]="装备时，其他角色计算与你的距离时，始终+2",
	
	["zunhat"]  = "ZUN帽",
	[":zunhat"]  = "装备时，其他角色计算与你的距离时，始终+1。锁定技，每当你回复灵力时额外回复1点。",
	["#Zunhat"] = "%from 的装备效果被触发，额外回复一点灵力",
	
	["mushroom"]= "奇怪的蘑菇",
	[":mushroom"]= "装备时，你与其他玩家计算距离时，始终-1。你受到其他玩家造成的伤害时，可以弃置装备区里的此牌令伤害来源弃掉2牌，否则受到你的1点伤害。",
	
	["tea"]     = "神社的清茶",
	[":tea"]     = "装备时，其他角色计算与你的距离时，始终+1。你可以在出牌阶段将装备区的此牌弃置，然后回复1点灵力并摸一张牌。此技能无法在装备此牌的回合使用。",
	
	["sinbag"]  = "罪袋",
	[":sinbag"]  = "装备时，你与其他玩家计算距离时，始终-1。你以灵击结算战斗前，可以弃置装备区里的此牌，跳过该战斗并对对方造成1点伤害。",
	["#Sinbag"] = "%from 跳过了战斗",
	
	["saisen"]  = "赛钱箱",
	[":saisen"]  = "装备时，你与其他玩家计算距离时，始终-1。你可以在出牌阶段将装备区的此牌弃置，并抽取一名手牌比你多的玩家的手牌。此技能无法在装备此牌的回合使用。",
	
	["hakkero"]="八卦炉",
	[":hakkero"]="攻击范围：1\
	武器特效：每回合你可以使用任意数目的战斗牌。",
	
	["tengu_fan"] = "天狗的扇子",
	[":tengu_fan"] = "攻击范围：1\
	武器特效：你的每张战斗牌可以指定额外一名目标。",
	
	["hisonoken"]="绯想之剑",
	[":hisonoken"]="攻击范围：3\
	武器特效：你翻开进攻牌前可以消耗一点灵力，查看一名进攻目标的防御牌，然后打出一张牌代替你原有的进攻牌。",
	["hisonoken-combat"] = "你可以打出一张战斗牌代替你原有的战斗牌",
	
	["gungnir"] = "冈格尼尔",
	[":gungnir"] = "攻击范围：3\
	武器特效：任意玩家的判定牌生效前，你可以将装备区的此牌打出并代替之。",
	
	["magic_book"]="元素魔法书",
	[":magic_book"]="攻击范围：2\
	武器特效：你翻开【弹幕】攻击牌后，可以弃置任意张【符咒】，每弃置一张，本次进攻你的弹幕造成的伤害+1。",
	["magic-book-rune"]="你可以弃置一张【符咒】来增加进攻牌的伤害",
	
	["umbrella"]= "无害的雨伞",
	[":umbrella"]= "攻击范围：2\
	武器特效：你进攻被束缚或有牌被冻结的角色时，对方需选择弃一张手牌或让你摸一张牌。",
	["umbrella-card"]= "你需弃一张手牌或让 %src 摸一张牌",
	
	["pad"]     = "PAD",
	[":pad"]     = "防具特效：锁定技，你没有宣告防御牌时，防御牌视为无花色的【灵击10】。",
	["$PadConvert"] = "%from 的防御牌视为了 %card",
	
	["doll"]    = "替身人偶",
	[":doll"]    = "防具特效：你需要宣告防御牌时，可令对方用牌堆顶的牌代替进攻牌。",
	["#DollExchange"] = "%from 替换了对方的战斗牌",
}