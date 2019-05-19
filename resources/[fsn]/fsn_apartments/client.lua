print 'ass'

function buildRoom(numMultiplier,roomType)
	-- this coord is the default object location, we use it to spawn in the interior.


	SetEntityCoords(GetPlayerPed(-1), 152.09986877441 , -1004.7946166992, -98.999984741211)

	Citizen.Wait(5000)

	local generator = { x = 175.09986877441 , y = -904.7946166992, z = -98.999984741211}
	generator.x = (175.09986877441) + ((numMultiplier * 12.0))
	
	if numMultiplier == myRoomNumber then
		myroomcoords = generator
	else
		curRoom = generator
	end

	SetEntityCoords(GetPlayerPed(-1), generator.x - 1, generator.y - 4, generator.z+1.8)
	local building = CreateObject(GetHashKey("v_49_motelmp_shell"),generator.x,generator.y,generator.z,false,false,false)

	FreezeEntityPosition(building,true)
	Citizen.Wait(100)
	FloatTilSafe(numMultiplier,roomType,building)

	CreateObject(GetHashKey("v_49_motelmp_stuff"),generator.x,generator.y,generator.z,false,false,false)
	CreateObject(GetHashKey("v_49_motelmp_bed"),generator.x+1.4,generator.y-0.55,generator.z,false,false,false)
	CreateObject(GetHashKey("v_49_motelmp_clothes"),generator.x-2.0,generator.y+2.0,generator.z+0.15,false,false,false)
	CreateObject(GetHashKey("v_49_motelmp_winframe"),generator.x+0.74,generator.y-4.26,generator.z+1.11,false,false,false)
	CreateObject(GetHashKey("v_49_motelmp_glass"),generator.x+0.74,generator.y-4.26,generator.z+1.13,false,false,false)
	CreateObject(GetHashKey("v_49_motelmp_curtains"),generator.x+0.74,generator.y-4.15,generator.z+0.9,false,false,false)

	CreateObject(GetHashKey("v_49_motelmp_screen"),generator.x-2.21,generator.y-0.6,generator.z+0.79,false,false,false)
	--props
	CreateObject(GetHashKey("v_res_fa_trainer02r"),generator.x-1.9,generator.y+3.0,generator.z+0.38,false,false,false)
	CreateObject(GetHashKey("v_res_fa_trainer02l"),generator.x-2.1,generator.y+2.95,generator.z+0.38,false,false,false)

	local sink = CreateObject(GetHashKey("prop_sink_06"),generator.x+1.1,generator.y+4.0,generator.z,false,false,false)
	local chair1 = CreateObject(GetHashKey("prop_chair_04a"),generator.x+2.1,generator.y-2.4,generator.z,false,false,false)
	local chair2 = CreateObject(GetHashKey("prop_chair_04a"),generator.x+0.7,generator.y-3.5,generator.z,false,false,false)
	local kettle = CreateObject(GetHashKey("prop_kettle"),generator.x-2.3,generator.y+0.6,generator.z+0.9,false,false,false)
	local tvCabinet = CreateObject(GetHashKey("Prop_TV_Cabinet_03"),generator.x-2.3,generator.y-0.6,generator.z,false,false,false)
	local tv = CreateObject(GetHashKey("prop_tv_06"),generator.x-2.3,generator.y-0.6,generator.z+0.7,false,false,false)
	local toilet = CreateObject(GetHashKey("Prop_LD_Toilet_01"),generator.x+2.1,generator.y+2.9,generator.z,false,false,false)
	local clock = CreateObject(GetHashKey("Prop_Game_Clock_02"),generator.x-2.55,generator.y-0.6,generator.z+2.0,false,false,false)
	local phone = CreateObject(GetHashKey("v_res_j_phone"),generator.x+2.4,generator.y-1.9,generator.z+0.64,false,false,false)
	local ironBoard = CreateObject(GetHashKey("v_ret_fh_ironbrd"),generator.x-1.7,generator.y+3.5,generator.z+0.15,false,false,false)
	local iron = CreateObject(GetHashKey("prop_iron_01"),generator.x-1.9,generator.y+2.85,generator.z+0.63,false,false,false)
	local mug1 = CreateObject(GetHashKey("V_Ret_TA_Mug"),generator.x-2.3,generator.y+0.95,generator.z+0.9,false,false,false)
	local mug2 = CreateObject(GetHashKey("V_Ret_TA_Mug"),generator.x-2.2,generator.y+0.9,generator.z+0.9,false,false,false)
	CreateObject(GetHashKey("v_res_binder"),generator.x-2.2,generator.y+1.3,generator.z+0.87,false,false,false)
	
	FreezeEntityPosition(sink,true)
	FreezeEntityPosition(chair1,true)	
	FreezeEntityPosition(chair2,true)
	FreezeEntityPosition(tvCabinet,true)	
	FreezeEntityPosition(tv,true)		
	SetEntityHeading(chair1,GetEntityHeading(chair1)+270)
	SetEntityHeading(chair2,GetEntityHeading(chair2)+180)
	SetEntityHeading(kettle,GetEntityHeading(kettle)+90)
	SetEntityHeading(tvCabinet,GetEntityHeading(tvCabinet)+90)
	SetEntityHeading(tv,GetEntityHeading(tv)+90)
	SetEntityHeading(toilet,GetEntityHeading(toilet)+270)
	SetEntityHeading(clock,GetEntityHeading(clock)+90)
	SetEntityHeading(phone,GetEntityHeading(phone)+220)
	SetEntityHeading(ironBoard,GetEntityHeading(ironBoard)+90)
	SetEntityHeading(iron,GetEntityHeading(iron)+230)
	SetEntityHeading(mug1,GetEntityHeading(mug1)+20)
	SetEntityHeading(mug2,GetEntityHeading(mug2)+230)


	if not isForced then
		TriggerServerEvent('hotel:getID')
	end


	curRoomType = 1

end


buildRoom(32,2)