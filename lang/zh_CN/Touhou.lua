return
{
	["touhou"] ="东方",
	["combat"] ="战斗牌",
	
	["#AnnounceAttack"]="%from 对 %to 进行攻击",
	["#chosenBlock"]   ="%from 打出了防御牌",
	["$revealResult"]  ="%from 的战斗牌是 %card",
	["blockCard"]      ="请打出一张防御牌",
	["ex-spell-barrage"]="请打出一张【弹幕】",
	["dannatu-barrage"] ="请打出一张【弹幕】",
	["full-scre-strike"]="请打出一张【灵击】或【符咒】",
	
	["#increasedMp"]    ="%from 回复了%arg点灵力",
	["#decreasedMp"]    ="%from 损失了%arg点灵力",
	
	["#SetConstraint"]  ="%from给%arg施加了束缚",
	["#LoseConstraint"] ="%from的束缚%arg失去作用" ,
	
	["guifu"] = "八方鬼缚阵",
	[":guifu"]= "每回一次，你可束缚一名玩家直到其回合结束：每当其使用一张牌，在其结算前需弃一张手牌。",
	
	["guifu_constraint"] = "束缚：八方鬼缚阵",
	[":guifu_constraint"] = "你每使用一张牌，须在其结算前弃置一张手牌。",
	
	["barrage"]="弹幕",
	[":barrage"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【弹幕】对目标角色造成1点伤害\
防御效果：抵消【符咒】或点数更小的【弹幕】的效果",
	
	["strike"]="灵击",
	[":strike"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【灵击】对目标角色造成1点灵力损失并返回手牌暂时冻结\
防御效果：抵消【弹幕】或点数更小的【灵击】的效果并返回手牌暂时冻结",
	
	["rune"]="符咒",
	[":rune"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围+灵力值内的一名角色\
作用效果：【符咒】对目标角色造成1点灵力损失与1点伤害\
防御效果：抵消【灵击】或点数更小的【符咒】的效果，并对来源造成1点灵力损失与1点伤害",
	
	["dannatu"]="弹压",
	[":dannatu"]="出牌时机：出牌阶段\
使用目标：除你以外，任意一名角色\
作用效果：由目标角色先开始，你和他（她）轮流打出一张【弹幕】，【弹压】对首先不出【弹幕】的一方造成1点伤害；另一方成为此伤害的来源", 
	["ex_spell"]="EX符卡",
	[":ex_spell"]="出牌时机：出牌阶段。\
使用目标：除你以外的所有角色。\
作用效果：按行动顺序结算，除非目标角色打出1张【弹幕】，否则该角色受到【EX符卡】对其造成的1点伤害", 
	["fullscrean_barrage"]="全屏弹幕",
	[":fullscrean_barrage"]="出牌时机：出牌阶段。\
使用目标：除你以外的所有角色。\
作用效果：按行动顺序结算，除非目标角色打出1张【灵击】或【符卡】，否则该角色受到【全屏弹幕】对其造成的1点伤害", 
	["surprise"] = "惊吓",
	[":surprise"]= "出牌时机：出牌阶段\
使用目标：除你以外，任意一名有手牌的角色\
作用效果：查看一名玩家的手牌，然后你可以选择其中一张展示并冻结（该玩家无法打出、使用或弃置该牌直到其回合结束）",
	["nice_guy_card"]="好人卡",
	[":nice_guy_card"]="此牌无主动使用效果。此牌被弃置时，你摸一张牌。",
	
	["yukkuri"] = "油库里",
	[":yukkuri"] = "装备时，你到其他玩家的距离-1。你可以在出牌阶段将装备区的此牌弃置，视为对任意玩家使用了一张【弹压】且不可被取消。此技能无法在装备此牌的回合使用。",
	
	["pants"]   = "少女的胖次",
	[":pants"]   = "装备时，你到其他玩家的距离-1。装备此牌时你的灵力与灵力上限+1，卸下此牌时你的灵力上限-1。",
	
	["broomstick"]="飞行扫帚",
	[":broomstick"]="装备时，其他玩家到你的距离+2",
	
	["zunhat"]  = "ZUN帽",
	[":zunhat"]  = "装备时，其他玩家到你的距离+1。每当你回复灵力可以额外回复1点。",
	["#Zunhat"] = "%from的装备效果被触发，额外回复一点灵力",
	
	["mushroom"]= "奇怪的蘑菇",
	[":mushroom"]= "装备时，你到其他玩家的距离-1。你受到其他玩家造成的伤害时，可以弃置装备区里的此牌令伤害来源弃掉2张手牌或装备，否则受到你的1点伤害。",
	
	["tea"]     = "神社的清茶",
	[":tea"]     = "装备时，其他玩家到你的距离+1。你可以在出牌阶段将装备区的此牌弃置，然后回复1点灵力并摸一张牌。此技能无法在装备此牌的回合使用。",
	
	["sinbag"]  = "罪袋",
	[":sinbag"]  = "装备时，你到其他玩家的距离-1。你以灵击结算战斗前，可以弃置装备区里的此牌，跳过该战斗并对对方造成1点伤害。",
	["#Sinbag"] = "%from跳过了战斗",
	
	["saisen"]  = "赛钱箱",
	[":saisen"]  = "装备时，你到其他玩家的距离-1。你可以在出牌阶段将装备区的此牌弃置，并抽取一名手牌比你多的玩家的手牌。此技能无法在装备此牌的回合使用。",
	
	["hakkero"]="八卦炉",
	[":hakkero"]="攻击范围：1\
	武器特效：每回合你可以使用任意数目的战斗牌。",
	
	["tengu_fan"] = "天狗的扇子",
	[":tengu_fan"] = "攻击范围：1\
	武器特效：你的每张战斗牌可以指定额外一名目标。",
	
	["hisonoken"]="绯想之剑",
	[":hisonoken"]="攻击范围：3\
	武器特效：你翻开进攻牌前可以查看1名进攻目标的防御牌，然后打出一张牌代替你原有的进攻牌。",
	["hisonoken-combat"] = "你可以打出一张战斗牌代替你的原有战斗牌",
	
	["gungnir"] = "冈格尼尔",
	[":gungnir"] = "攻击范围：3\
	武器特效：任意玩家的判定牌生效前，你可以将装备区的此牌打出并代替之。",
	
	["magic_book"]="元素魔法书",
	[":magic_book"]="攻击范围：2\
	武器特效：你翻开【弹幕】攻击牌后，可以弃置任意张【弹幕】，每弃置一张，本次进攻你的弹幕造成的伤害+1。",
	["magic-book-rune"]="你可以打出一张【符咒】来增加进攻牌的伤害",
	
	["umbrella"]= "无害的雨伞",
	[":umbrella"]= "攻击范围：2\
	武器特效：你进攻被束缚或有牌被冻结的角色时，对方需选择弃一张手牌或让你摸一张牌。",
	["umbrella-card"]= "你需弃一张手牌或让%src摸一张牌",
	
	["pad"]     = "PAD",
	[":pad"]     = "防具特效：你没有防御牌时，防御牌视为无花色的【灵击A】。",
	["#PadConvert"] = "%from的防御牌视为了%card",
	
	["doll"]    = "替身人偶",
	[":doll"]    = "防具特效：你需要宣告防御牌时，可令进攻牌与牌堆顶牌交换。",
	["#DollNullify"] = "【灵击】对%from无效",
}