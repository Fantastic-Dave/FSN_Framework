local doors = {
	--[[
		MRPD
	]]--
	{ -- [MRPD] captains office
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 447.25018310547, y = -980.03253173828, z = 30.689426422119},
		ents = {{
			mdl = -1320876379,
			x = 446.572,
			y = -980.010,
			z = 30.838
		}},
	},
	{ -- [MRPD] armory
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 453.07046508789, y = -982.51171875, z = 30.689443588257},
		ents = {{
			mdl = 749848321,
			x = 453.079,
			y = -983.189,
			z = 30.839
		}},
	},
	{ -- [MRPD] changing room lobby door
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 449.93371582031, y = -986.52996826172, z = 30.68943977356},
		ents = {{
			mdl = 1557126584,
			x = 450.104,
			y = -985.738,
			z = 30.839
		}},
	},
	{ -- [MRPD] changing room door
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 451.92156982422, y = -987.48687744141, z = 30.68943977356},
		ents = {{
			mdl = -2023754432,
			x = 452.624,
			y = -987.362,
			z = 30.839
		}},
	},
	{ -- [MRPD] helipad door
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 464.46398925781, y = -983.94659423828, z = 43.691871643066},
		ents = {{
			mdl = -340230128,
			x = 464.361,
			y = -984.678,
			z = 43.834
		}},
	},
	{ -- [MRPD] lobby double doors
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 444.72122192383, y = -989.41009521484, z = 30.68989944458},
		ents = {
			{
				mdl = -131296141,
				x = 446.007,
				y = -989.445,
				z = 30.839
			},
			{
				mdl = -131296141,
				x = 443.407,
				y = -989.445,
				z = 30.839
			},
		},
	},
	{ -- [MRPD] meeting room doors
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 443.10925292969, y = -993.15270996094, z = 30.689449310303},
		ents = {
			{
				mdl = -131296141,
				x = 443.029,
				y = -994.541,
				z = 30.838
			},
			{
				mdl = -131296141,
				x = 443.029,
				y = -991.941,
				z = 30.838
			},
		},
	},
	{ -- [MRPD] whiteboard room doors
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 446.53750610352, y = -986.53735351563, z = 26.674192428589},
		ents = {
			{
				mdl = 185711165,
				x = 446.147,
				y = -987.802,
				z = 26.830
			},
			{
				mdl = 185711165,
				x = 446.144,
				y = -985.199,
				z = 26.830
			},
		},
	},
	{ -- [MRPD] downstairs waiting area doors
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 452.09020996094, y = -983.94927978516, z = 26.674201965332},
		ents = {
			{
				mdl = 1557126584,
				x = 450.797,
				y = -983.919,
				z = 26.811
			},
			{
				mdl = 1557126584,
				x = 453.402,
				y = -983.906,
				z = 26.830
			},
		},
	},
	{ -- [MRPD] break room
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 454.86215209961, y = -976.67810058594, z = 26.674203872681},
		ents = {{
			mdl = 1557126584,
			x = 454.192,
			y = -976.644,
			z = 26.819
		}},
	},
	{ -- [MRPD] lower hallway entrance
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 465.73602294922, y = -989.98968505859, z = 24.915092468262},
		ents = {
			{
				mdl = -131296141,
				x = 465.578,
				y = -988.698,
				z = 25.057
			},
			{
				mdl = -131296141,
				x = 465.578,
				y = -991.300,
				z = 25.058
			},
		},
	},
	{ -- [MRPD] cell room (cell 1 (from left))
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 474.00863647461, y = -982.97302246094, z = 24.915077209473},
		ents = {{
			mdl = 631614199,
			x = 474.081,
			y = -982.139,
			z = 25.03
		}},
	},
	{ -- [MRPD] cell room (cell 2 (from left))
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 474.06011962891, y = -986.49401855469, z = 24.91508102417},
		ents = {{
			mdl = 631614199,
			x = 474.124,
			y = -985.543,
			z = 25.03
		}},
	},
	{ -- [MRPD] cell room (cell 3 (from left))
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 474.154296875, y = -989.86730957031, z = 24.915079116821},
		ents = {{
			mdl = 631614199,
			x = 474.111,
			y = -988.949,
			z = 25.03
		}},
	},
	{ -- [MRPD] inner holding cells gate
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 463.68035888672, y = -992.54150390625, z = 24.91508102417},
		ents = {{
			mdl = 631614199,
			x = 464.570,
			y = -992.664,
			z = 25.06
		}},
	},
	{ -- [MRPD] holding cell 1 (from left)
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 461.92553710938, y = -1001.9869995117, z = 24.915079116821},
		ents = {{
			mdl = 631614199,
			x = 461.806,
			y = -1001.301,
			z = 25.06
		}},
	},
	{ -- [MRPD] holding cell 2 (from left)
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 461.88604736328, y = -998.41229248047, z = 24.915079116821},
		ents = {{
			mdl = 631614199,
			x = 461.806,
			y = -997.658,
			z = 25.06
		}},
	},
	{ -- [MRPD] holding cell 3 (from left)
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 462.00164794922, y = -993.53778076172, z = 24.915077209473},
		ents = {{
			mdl = 631614199,
			x = 461.806,
			y = -994.408,
			z = 25.06
		}},
	},
	{ -- [MRPD] holding cells rear door
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 464.18118286133, y = -1003.5407714844, z = 24.915071487427},
		ents = {{
			mdl = -1033001619,
			x = 463.478,
			y = -1003.538,
			z = 25.005
		}},
	},
	{ -- [MRPD] questioning room
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 477.87393188477, y = -1007.869934082, z = 26.386611938477},
		ents = {
			{
				mdl = -131296141,
				x = 476.580,
				y = -1007.839,
				z = 26.53
			},
			{
				mdl = -131296141,
				x = 479.177,
				y = -1007.874,
				z = 26.537
			},
		},
	},
	{ -- [MRPD] questioning room (watching)
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 472.4235534668, y = -1007.7745361328, z = 26.387144088745},
		ents = {
			{
				mdl = -131296141,
				x = 471.229,
				y = -1007.812,
				z = 26.53
			},
			{
				mdl = -131296141,
				x = 473.833,
				y = -1007.873,
				z = 26.537
			},
		},
	},
	{ -- [MRPD] rear entrance
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 468.68609619141, y = -1014.3939208984, z = 26.386367797852},
		ents = {
			{
				mdl = -2023754432,
				x = 467.371,
				y = -1014.452,
				z = 26.53
			},
			{
				mdl = -2023754432,
				x = 469.967,
				y = -1014.452,
				z = 26.537
			},
		},
	},
	{ -- [MRPD] rear gate
		double = false,
		locked = true,
		lookingat = false,
		lockdist = 10,
		disp = {x = 489.42715454102, y = -1017.2208862305, z = 28.039844512939},
		ents = {{
			mdl = -1603817716,
			x = 488.894,
			y = -1017.210,
			z = 27.145
		}},
	},
	--[[
		Sandy Shores
	]]--
	{ -- [SANDY] front door
		double = false,
		locked = false,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1855.095703125, y = 3683.5017089844, z = 34.275344848633},
		ents = {{
			mdl = -1765048490,
			x = 1855.689,
			y = 3683.919,
			z = 34.592
		}},
	},
	{ -- [SANDY] meeting room
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1857.037109375, y = 3690.1330566406, z = 34.27685546875},
		ents = {{
			mdl = -1033001619,
			x = 1856.125,
			y = 3689.656,
			z = 34.419
		}},
	},
	{ -- [SANDY] evidence / weapon room
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1851.7095947266, y = 3695.5925292969, z = 34.276863098145},
		ents = {{
			mdl = -1033001619,
			x = 1851.117,
			y = 3696.457,
			z = 34.421
		}},
	},
	{ -- [SANDY] main > hall
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1850.5668945313, y = 3682.9252929688, z = 34.276859283447},
		ents = {
			{
				mdl = -2023754432,
				x = 1851.288,
				y = 3681.868,
				z = 34.420
			},
			{
				mdl = -2023754432,
				x = 1849.967,
				y = 3684.1044,
				z = 34.420
			},
		},
	},
	{ -- [SANDY] hall > cells
		double = true,
		locked = false,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1844.8298339844, y = 3681.7060546875, z = 34.276866912842},
		ents = {
			{
				mdl = -2023754432,
				x = 1843.717,
				y = 3681.074,
				z = 34.419
			},
			{
				mdl = -2023754432,
				x = 1845.971,
				y = 3682.372,
				z = 34.419
			},
		},
	},
	{ -- [SANDY] Cell left first
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1842.380859375, y = 3682.3208007813, z = 34.27685546875},
		ents = {{
			mdl = 631614199,
			x = 1841.859,
			y = 3683.236,
			z = 34.416
			}},
	},
	{ -- [SANDY] Cell left second
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1840.8865966797, y = 3684.9274902344, z = 34.27685546875},
		ents = {{
			mdl = 631614199,
			x = 1840.371,
			y = 3685.841,
			z = 34.416
			}},
	},
	{ -- [SANDY] Cell right first
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1845.8293457031, y = 3683.7687988281, z = 34.276878356934},
		ents = {{
			mdl = 631614199,
			x = 1846.336,
			y = 3682.859,
			z = 34.416
			}},
	},
	{ -- [SANDY] Cell right second
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1844.3096923828, y = 3686.3586425781, z = 34.276878356934},
		ents = {{
			mdl = 631614199,
			x = 1844.832,
			y = 3685.461,
			z = 34.416
			}},
	},
	{ -- [SANDY] cells > questioning
		double = true,
		locked = false,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1841.9870605469, y = 3686.849609375, z = 34.27685546875},
		ents = {
			{
				mdl = -2023754432,
				x = 1840.832,
				y = 3686.243,
				z = 34.419
			},
			{
				mdl = -2023754432,
				x = 1843.086,
				y = 3687.539,
				z = 34.419
			},
		},
	},
	{ -- [SANDY] halls > questioning watch
		double = true,
		locked = false,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1835.2150878906, y = 3682.8361816406, z = 34.276847839355},
		ents = {
			{
				mdl = -2023754432,
				x = 1834.131,
				y = 3682.258,
				z = 34.419
			},
			{
				mdl = -2023754432,
				x = 1836.385,
				y = 3683.554,
				z = 34.419
			},
		},
	},
	{ -- [SANDY] main > office
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1848.2888183594, y = 3690.5307617188, z = 34.276851654053},
		ents = {
			{
				mdl = -2023754432,
				x = 1847.157,
				y = 3689.891,
				z = 34.419
			},
			{
				mdl = -2023754432,
				x = 1849.409,
				y = 3691.188,
				z = 34.419
			},
		},
	},
	--[[
		JAIL
	]]--
	{ -- [JAIL] first gate
		double = false,
		locked = true,
		lookingat = false,
		lockdist = 10,
		disp = {x = 1844.6950683594, y = 2608.0844726563, z = 45.585975646973},
		ents = {{
			mdl = 741314661,
			x = 1844.998,
			y = 2604.812,
			z = 44.639
		}},
	},
	{ -- [JAIL] second gate
		double = false,
		locked = true,
		lookingat = false,
		lockdist = 10,
		disp = {x = 1818.7651367188, y = 2608.6252441406, z = 45.595508575439},
		ents = {{
			mdl = 741314661,
			x = 1818.542,
			y = 2604.810,
			z = 44.639
		}},
	},
	{ -- [JAIL] second gate
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = 1796.8231201172, y = 2596.703125, z = 45.664043426514},
		ents = {{
			mdl = -1156020871,
			x = 1797.760,
			y = 2596.654,
			z = 46.387
		}},
	},
	{ -- [JAIL] third gate
		double = false,
		locked = true,
		lookingat = false,
		lockdist = 10,
		disp = {x = 1796.1750488281, y = 2616.9672851563, z = 45.564987182617},
		ents = {{
			mdl = 741314661,
			x = 1799.610,
			y = 2616.975,
			z = 44.639
		}},
	},
	--[[
		Paleto
	]]--
	{ -- [Paleto] Cell Door
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = -434.835, y = 6003.869, z = 31.8661},
		ents = {{
			mdl = 631614199,
			x = -433.910,
			y = 6004.791,
			z = 31.866
		}},
	},
	{ -- [Paleto] Cell Room
		double = true,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = -441.9548034668, y = 6011.8881835938, z = 31.71639251709},
		ents = {
			{
				mdl = -2023754432,
				x = -440.987,
				y = 6012.764,
				z = 31.866
			},
			{
				mdl = -2023754432,
				x = -442.826,
				y = 6010.925,
				z = 31.866
			},
		},
	},
	{ -- [Paleto] locker room
		double = false,
		locked = true,
		lookingat = true,
		lockdist = 2,
		disp = {x = -450.09637451172, y = 6015.6474609375, z = 31.716415405273},
		ents = {{
			mdl = -2023754432,
			x = -450.715,
			y = 6016.369,
			z = 31.866
		}},
	},
	}

RegisterServerEvent('fsn_doormanager:request')
AddEventHandler('fsn_doormanager:request', function()
	TriggerClientEvent('fsn_doormanager:request', source, doors)
end)

RegisterServerEvent('fsn_doormanager:toggle')
AddEventHandler('fsn_doormanager:toggle', function(id)
	doors[id].locked = not doors[id].locked
	TriggerClientEvent('fsn_doormanager:request', -1, doors)
end)
