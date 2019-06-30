local desks = {
	["Hawick Ave"] = {
		door = {
			mdl = -131754413,
			x = 145.418,
			y = -1041.8125,
			z = 29.642,
			locked = true
		},
		keyboards = {
			mdl = -954257764,
			[1] = {
				payout = math.random(500,1000),
				robspot = {x = 311.05963134766, y = -279.4684753418, z = 54.16463470459, h = 341.77679443359},
				x = 311.296,
				y = -278.917,
				z = 54.380,
				robbed = false,
			},
			[2] = {
				payout = math.random(500,1000),
				robspot = {x = 312.52819824219, y = -279.99087524414, z = 54.164661407471, h = 334.24438476563},
				x = 312.679,
				y = -279.417,
				z = 54.380,
				robbed = false,
			},
			[3] = {
				payout = math.random(500,1000),
				robspot = {x = 314.01126098633, y = -280.52255249023, z = 54.164703369141, h = 338.13391113281},
				x = 614.118,
				y = -279.945,
				z = 54.380,
				robbed = false,
			},
			[4] = {
				payout = math.random(500,1000),
				robspot = {x = 315.26541137695, y = -281.04843139648, z = 54.16471862793, h = 335.29302978516},
				x = 315.42,
				y = -280.437,
				z = 54.380,
				robbed = false,
			},
		}
	},
	["Legion Sq"] = {
		door = {
			mdl = -131754413,
			x = 309.749,
			y = -280.179,
			z = 54.439,
			locked = false
		},
		keyboards = {
			mdl = -954257764,
			[1] = {
				payout = math.random(500,1000),
				robspot = {x = 146.72927856445, y = -1041.1540527344, z = 29.367919921875, h = 340.09686279297},
				x = 146.966,
				y = -1040.550,
				z = 29.584,
				robbed = false,
			},
			[2] = {
				payout = math.random(500,1000),
				robspot = {x = 148.19299316406, y = -1041.6196289063, z = 29.36795425415, h = 338.73071289063},
				x = 148.349,
				y = -1041.051,
				z = 29.584,
				robbed = false,
			},
			[3] = {
				payout = math.random(500,1000),
				robspot = {x = 149.5933380127, y = -1042.1168212891, z = 29.367990493774, h = 347.94549560547},
				x = 149.788,
				y = -1041.79,
				z = 29.584,
				robbed = false,
			},
			[4] = {
				payout = math.random(500,1000),
				robspot = {x = 150.82872009277, y = -1042.5831298828, z = 29.368017196655, h = 343.71429443359},
				x = 151.093,
				y = -1042.072,
				z = 29.584,
				robbed = false,
			},
		}
	},
}

RegisterNetEvent('fsn_bankrobbery:desks:request')
AddEventHandler('fsn_bankrobbery:desks:request', function()
	TriggerClientEvent('fsn_bankrobbery:desks:receive', source, desks)
end)