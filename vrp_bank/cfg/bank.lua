--Script by DarkHaze1498 Revolution-Roleplay.de--

cfg = {}


cfg.blips = false --Hier auf True setzen um Blips anzeigen zu lassen!

cfg.seconds = 600 --In sekunden angeben, wie lange das ausrauben dauert!

cfg.cooldown = 1800 -- wie lange man warten muss bis zum Nächsten überfall! (Auch in Sekunden!)

cfg.cops = 2 --Wie viele cops online sein müssen!

cfg.permission = "bank.police" --Müssen wir noch eintragen in der Groups.lua

cfg.banks = { -- Hier werden Banken/Shops/Etc eingefügt

    ["fleeca"] = {
        position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
        reward = 30000 + math.random(100000,200000),
        nameofbank = "Fleeca Bank",
        lastrobbed = 0
    },
    ["fleeca2"] = {
        position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
        reward = 30000 + math.random(100000,200000),
        nameofbank = "Fleeca Bank Highway",
        lastrobbed = 0
    },

	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Blaine County Savings",
		lastrobbed = 0
	},
	["fleeca3"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Vinewood Hills)",
		lastrobbed = 0
	},
	["fleeca4"] = {
		position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 48.0463104248047 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Burton)",
		lastrobbed = 0
	},
	["fleeca5"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Alta)",
		lastrobbed = 0
	},
	["fleeca6"] = {
		position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Desert)",
		lastrobbed = 0
	},
	["pacific"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = 60000 + math.random(100000,200000),
		nameofbank = "Pacific Standard PDB (Downtown Vinewood)",
		lastrobbed = 0
	}
}






}