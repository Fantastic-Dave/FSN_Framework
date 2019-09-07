-- Government Vehicle

  --------------------
  -- LSPD Cars
  --------------------
return {
	CHandlingData {
		HandlingName = "CHARGER", -- Dodge Charger (101)
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.03,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.2, 0.04 },
		InertiaMultiplier  = { 1, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.375,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 172,
		SteeringLock                   = 45.5,

		-- Brake
		BrakeForce     = 0.425,
		BrakeBiasFront = 0.425,
		HandBrakeForce = 0.601,

		-- Traction
		TractionCurveMax         = 2.45,
		TractionCurveMin         = 2.35,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.02,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.484,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.1,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 2.2,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.12,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.47,
		AntiRollBarForce	  = 1.1,
		AntiRollBarBiasFront  = 0.58,
		RollCentreHeightFront = 0.36,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "CVPI", -- Ford Crown Vic (109)
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.1,
		DownforceModifier  = 1.5,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.2, 0.04 },
		InertiaMultiplier  = { 1, 1.07,    1.28 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.42,
		DriveInertia                   = 0.83,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.37,
		BrakeBiasFront = 0.5251,
		HandBrakeForce = 0.901,

		-- Traction
		TractionCurveMax         = 1.7,
		TractionCurveMin         = 1.67,
		TractionCurveLateral	 = 19.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.485,
		TractionLossMult         = 1.04,

		-- Suspension
		SuspensionForce       = 2.25,
		SuspensionCompDamp    = 1.21,
		SuspensionReboundDamp = 0.43,
		SuspensionUpperLimit  = 0.096,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.515,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.454,
		RollCentreHeightRear  = 0.454,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
		ModelFlags		= '000010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.09,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
--	CHandlingData {
		
--		HandlingName = "EXPLORER", -- Ford Explorer (104)
		-- Physical
--		Mass               = 2450,
--		InitialDragCoeff   = 2.4,
--		PercentSubmerged   = 85,
--		CentreOfMassOffset = { 0,    0.065, -0.061 },
--		InertiaMultiplier  = { 1, 1.09,    1.21 },

		-- Transmission
--		DriveBiasFront                 = 0.5,
--		InitialDriveGears              = 6,
--		InitialDriveForce              = 0.15,
--		DriveInertia                   = 0.99,
--		ClutchChangeRateScaleUpShift   = 2.0,
--		ClutchChangeRateScaleDownShift = 2.3,
--		InitialDriveMaxFlatVel         = 190,
--		SteeringLock                   = 38.0,

		-- Brake
--		BrakeForce     = 0.645,
--		BrakeBiasFront = 0.6028,
--		HandBrakeForce = 0.6,

		-- Traction
--		TractionCurveMax         = 1.45,
--		TractionCurveMin         = 1.24,
--		TractionCurveLateral	 = 16.5,
--		TractionSpringDeltaMax   = 0.13,
--		LowSpeedTractionLossMult = 0.4,
--		CamberStiffnesss		 = 0,
--		TractionBiasFront        = 0.4839,
--		TractionLossMult         = 0.87,

		-- Suspension
--		SuspensionForce       = 2.0,
--		SuspensionCompDamp    = 1.65,
--		SuspensionReboundDamp = 0.4,
--		SuspensionUpperLimit  = 0.14,
--		SuspensionLowerLimit  = -0.122,
--		SuspensionRaise		  = 0.0,
--		SuspensionBiasFront   = 0.53,
--		AntiRollBarForce	  = 0.09,
--		AntiRollBarBiasFront  = 0.53,
--		RollCentreHeightFront = 0.21,
--		RollCentreHeightRear  = 0.2,

		-- Damage
--		CollisionDamageMult         = 1.0,
--		WeaponDamageMult			= 1.0,
--		DeformationDamageMult		= 2.0,
--		EngineDamageMult			= 20.0,
--		PetrolTankVolume			= 65.0,
--		OilVolume					= 5.0,

		-- Misc
--		SeatOffsetDistX = 0.1,
--		SeatOffsetDistY = 0.0,
--		SeatOffsetDistZ = 0.0,
--		MonetaryValue   = 55000,
--		ModelFlags		= '000010',
--		HandlingFlags   = "820100",
--		DamageFlags		= "0",
--		AIHandling		= "AVERAGE",

--		SubHandling = {
--			CCarHandlingData {
--				BackEndPopUpCarImpulseMult      = 0.08,
--				BackEndPopUpBuildingImpulseMult = 0.03,
--				BackEndPopUpMaxDeltaSpeed       = 0.6
--			}
--		}
--	},
	CHandlingData {
		
		HandlingName = "F350", -- Ford F-350 (106)
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.355,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 138,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.417,
		BrakeBiasFront = 0.48182,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 2.18,
		TractionCurveMin         = 2.07,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 0.82,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.09,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.448,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 75000,
		ModelFlags		= '240010',
		HandlingFlags   = "800008",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "TAHOE", -- Chevy Tahoe New (103)
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 5.4,
		DownforceModifier  = 1.7,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.065, -0.061 },
		InertiaMultiplier  = { 1, 1.09,    1.21 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.298,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 2.9,
		ClutchChangeRateScaleDownShift = 3.3,
		InitialDriveMaxFlatVel         = 168,
		SteeringLock                   = 37.0,

		-- Brake
		BrakeForce     = 0.475,
		BrakeBiasFront = 0.6028,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4839,
		TractionLossMult         = 0.8,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 1.65,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.14,
		SuspensionLowerLimit  = -0.122,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.09,
		AntiRollBarBiasFront  = 0.53,
		AntiRollBarBiasFront  = 0.21,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.55,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "820100",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "OTAHOE", -- Chevy Tahoe Old (105)
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 5.4,
		DownforceModifier  = 1.61,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.065, -0.061 },
		InertiaMultiplier  = { 1, 1.09,    1.21 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.298,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 2.9,
		ClutchChangeRateScaleDownShift = 3.3,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 37.0,

		-- Brake
		BrakeForce     = 0.445,
		BrakeBiasFront = 0.602,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.82,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.4,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4839,
		TractionLossMult         = 0.87,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 1.65,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.14,
		SuspensionLowerLimit  = -0.122,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.09,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.21,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '240010',
		HandlingFlags   = "800008",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "RAM", -- Dodge Ram (107)
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.355,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.417,
		BrakeBiasFront = 0.48182,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 2.18,
		TractionCurveMin         = 2.07,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 0.82,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.09,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.448,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 75000,
		ModelFlags		= '240010',
		HandlingFlags   = "800008",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FRAPTOR", -- Ford Raptor (108)
		-- Physical
		Mass               = 2200,
		InitialDragCoeff   = 3.41,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.13, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.41 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.583,
		DriveInertia                   = 1.20,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 180,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.445,
		BrakeBiasFront = 0.5028,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.55,
		TractionCurveMin         = 1.34,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.42,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4839,
		TractionLossMult         = 0.87,

		-- Suspension
		SuspensionForce       = 2.28,
		SuspensionCompDamp    = 1.45,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.174,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.469,
		AntiRollBarForce	  = 0.09,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.789,
		RollCentreHeightRear  = 0.789,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 75000,
		ModelFlags		= '240010',
		HandlingFlags   = "800008",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.08,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "TAURUS", -- Ford Taurus (102)
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 3.25,
		DownforceModifier  = 1.7,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.2, 0.015 },
		InertiaMultiplier  = { 0.666, 0.666,    0.666 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.348,
		DriveInertia                   = 0.92,
		ClutchChangeRateScaleUpShift   = 1.1,
		ClutchChangeRateScaleDownShift = 1.2,
		InitialDriveMaxFlatVel         = 180,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.435,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.15,
		TractionCurveMin         = 1.995,
		TractionCurveLateral	 = 19.7,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.06,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4824,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.82,
		SuspensionCompDamp    = 1.22,
		SuspensionReboundDamp = 1.71,
		SuspensionUpperLimit  = 0.132,
		SuspensionLowerLimit  = -0.168,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.51,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.61,
		RollCentreHeightFront = 0.605,
		RollCentreHeightRear  = 0.603,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
--	CHandlingData {
		
--		HandlingName = "HARLEY", -- Harley (110)
		-- Physical
--		Mass               = 1550,
--		InitialDragCoeff   = 4.79,
--		DownforceModifier  = 1.43,
--		PercentSubmerged   = 72,
--		CentreOfMassOffset = { 0,    -0.095, 0.038 },
--		InertiaMultiplier  = { 1.16, 1,    1.46 },

		-- Transmission
--		DriveBiasFront                 = 0.468,
--		InitialDriveGears              = 6,
--		InitialDriveForce              = 0.303,
--		DriveInertia                   = 1.04,
--		ClutchChangeRateScaleUpShift   = 1.5,
--		ClutchChangeRateScaleDownShift = 1.5,
--		InitialDriveMaxFlatVel         = 156,
--		SteeringLock                   = 35.2,

		-- Brake
--		BrakeForce     = 0.523,
--		BrakeBiasFront = 0.478,
--		HandBrakeForce = 0.85,

		-- Traction
--		TractionCurveMax         = 1.98,
--		TractionCurveMin         = 1.895,
--		TractionCurveLateral	 = 17.0,
--		TractionSpringDeltaMax   = 0.141,
--		LowSpeedTractionLossMult = 1.01,
--		CamberStiffnesss		 = 0,
--		TractionBiasFront        = 0.4865,
--		TractionLossMult         = 1.08,

		-- Suspension
--		SuspensionForce       = 3.02,
--		SuspensionCompDamp    = 1.37,
--		SuspensionReboundDamp = 0.62,
--		SuspensionUpperLimit  = 0.068,
--		SuspensionLowerLimit  = -0.139,
--		SuspensionRaise		  = 0.004,
--		SuspensionBiasFront   = 0.439,
--		AntiRollBarForce	  = 0,
--		AntiRollBarBiasFront  = 0.25,
--		RollCentreHeightFront = 0.256,
--		RollCentreHeightRear  = 0.253,

		-- Damage
--		CollisionDamageMult         = 1.0,
--		WeaponDamageMult			= 1.0,
--		DeformationDamageMult		= 2.0,
--		EngineDamageMult			= 15.0,
--		PetrolTankVolume			= 65.0,
--		OilVolume					= 5.0,

		-- Misc
--		SeatOffsetDistX = 0,
--		SeatOffsetDistY = -0.1,
--		SeatOffsetDistZ = 0,
--		MonetaryValue   = 100000,
--		ModelFlags		= '440010',
--		HandlingFlags   = "0",
--		DamageFlags		= "0",
--		AIHandling		= "AVERAGE",

--		SubHandling = {
--			CCarHandlingData {
--				BackEndPopUpCarImpulseMult      = 0.07,
--				BackEndPopUpBuildingImpulseMult = 0.05,
--				BackEndPopUpMaxDeltaSpeed       = 0.6
--			}
--		}
--	},
	CHandlingData {
		
		HandlingName = "pbus", -- Prison Bus (111)
		-- Physical
		Mass               = 9000,
		InitialDragCoeff   = 10,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.0, 0.0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.15,
		DriveInertia                   = 0.5,
		ClutchChangeRateScaleUpShift   = 1.1,
		ClutchChangeRateScaleDownShift = 1.2,
		InitialDriveMaxFlatVel         = 100,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.25,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 1.35,
		TractionCurveMin         = 1.2,
		TractionCurveLateral	 = 35.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.44,
		TractionLossMult         = 0.9,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 0.9,
		SuspensionReboundDamp = 1.8,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.5,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.4,
		RollCentreHeightRear  = 0.4,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 120.0,
		OilVolume					= 8.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 25000,
		ModelFlags		= '20840018',
		HandlingFlags   = "40000",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "POLICET", -- Transport Van (112)
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.59,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, -0.015 },
		InertiaMultiplier  = { 1, 1.08,    1.24 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.186,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 134,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.64,
		BrakeBiasFront = 0.607,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.41,
		TractionCurveMin         = 1.2,
		TractionCurveLateral	 = 19.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.25,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.02,

		-- Suspension
		SuspensionForce       = 1.74,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.131,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.58,
		RollCentreHeightRear  = 0.58,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '444018',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "2015POLSTANG", -- Ford Mustang (2001)
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.136, -0.023 },
		InertiaMultiplier  = { 0.99, 1.03,    1.74 },

		-- Transmission
		DriveBiasFront                 = 0.155,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.525,
		DriveInertia                   = 1.35,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 215,
		SteeringLock                   = 41.2,

		-- Brake
		BrakeForce     = 0.8641,
		BrakeBiasFront = 0.5573,
		HandBrakeForce = 0.77,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 2.04,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 0.79,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4789,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.82,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.00,
		SuspensionBiasFront   = 0.557,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.25,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "820102",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "CHALLENGER", -- Dodge Challenger (2002)
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.88,
		DownforceModifier  = 1.04,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.191, -0.112 },
		InertiaMultiplier  = { 1.15, 0.99,    1.67 },

		-- Transmission
		DriveBiasFront                 = 0.155,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.525,
		DriveInertia                   = 1.35,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 230,
		SteeringLock                   = 41.2,

		-- Brake
		BrakeForce     = 0.5641,
		BrakeBiasFront = 0.5573,
		HandBrakeForce = 0.77,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 2.04,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 0.79,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4789,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.25,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.6199,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.32,
		RollCentreHeightRear  = 0.33,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.15,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
		HandlingFlags   = "820102",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ghispo2", -- Maserati (2003)
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.135, 0.03 },
		InertiaMultiplier  = { 1.18, 1,    1.89 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.399,
		DriveInertia                   = 1.28,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 170,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.481,
		BrakeBiasFront = 0.3885,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.28,
		TractionCurveMin         = 2.111,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.142,
		LowSpeedTractionLossMult = 0.69,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4823,
		TractionLossMult         = 1.31,

		-- Suspension
		SuspensionForce       = 3.14,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.0535,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = 0.015,
		SuspensionBiasFront   = 0.454,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.332,
		RollCentreHeightRear  = 0.307,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 105000,
		ModelFlags		= '000010',
		HandlingFlags   = "0820102",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "POLSCHAFTER3", -- Schafter (1008)
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 4.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.2,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.305,
		DriveInertia                   = 1.09,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 173,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.47982,
		HandBrakeForce = 0.9,

		-- Traction
		TractionCurveMax         = 2.05,
		TractionCurveMin         = 1.95,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.02,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionLowerLimit  = -0.135,
		SuspensionBiasFront   = 0.448,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Misc
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 95000,
		ModelFlags		= '400010',
		HandlingFlags   = "0820102",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
--------------------
-- Judge Cars
--------------------
	CHandlingData {
		
		HandlingName = "m5f90", -- BMW
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 5.25,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.05, 0.0 },
		InertiaMultiplier  = { 1.2, 1.3,    1.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.399,
		DriveInertia                   = 1.28,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 180,
		SteeringLock                   = 40.0,

		-- Brake
		BrakeForce     = 0.514,
		BrakeBiasFront = 0.425,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.55,
		TractionCurveMin         = 2.25,
		TractionCurveLateral	 = 20.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.05,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.75,
		SuspensionCompDamp    = 1.425,
		SuspensionReboundDamp = 2.025,
		SuspensionUpperLimit  = 0.08,
		SuspensionLowerLimit  = -0.12,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.55,
		AntiRollBarForce	  = 0.8,
		AntiRollBarBiasFront  = 0.7,
		RollCentreHeightFront = 0.37,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "p90d", -- Tesla
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 8.3,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.1, -0.05 },
		InertiaMultiplier  = { 1.2, 1.2,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 1,
		InitialDriveForce              = 0.2505,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 9,
		ClutchChangeRateScaleDownShift = 9,
		InitialDriveMaxFlatVel         = 200,
		SteeringLock                   = 40.0,

		-- Brake
		BrakeForce     = 0.428,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.25,
		TractionCurveMin         = 1.917,
		TractionCurveLateral	 = 16.7,
		TractionSpringDeltaMax   = 0.14,
		LowSpeedTractionLossMult = 1.05,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4026,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 2.1,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 2.0,
		SuspensionUpperLimit  = 0.05,
		SuspensionLowerLimit  = -0.09,
		SuspensionRaise		  = 0.01,
		SuspensionBiasFront   = 0.54,
		AntiRollBarForce	  = 0.7,
		AntiRollBarBiasFront  = 0.64,
		RollCentreHeightFront = 0.47,
		RollCentreHeightRear  = 0.47,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 20.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "1000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
--------------------
-- EMS Cars
--------------------
--	CHandlingData {
		
--		HandlingName = "JESTER2",
		-- Physical
--		Mass               = 1400,
--		InitialDragCoeff   = 3.54,
--		DownforceModifier  = 2.1,
--		PercentSubmerged   = 72,
--		CentreOfMassOffset = { 0,    -0.197, 0.01 },
--		InertiaMultiplier  = { 1.14, 0.99,    1.55 },

		-- Transmission
--		DriveBiasFront                 = 0,
--		InitialDriveGears              = 6,
--		InitialDriveForce              = 0.351,
--		DriveInertia                   = 1,
--		ClutchChangeRateScaleUpShift   = 2.4,
--		ClutchChangeRateScaleDownShift = 2.3,
--		InitialDriveMaxFlatVel         = 191,
--		SteeringLock                   = 32.8,

		-- Brake
--		BrakeForce     = 0.551,
--		BrakeBiasFront = 0.427,
--		HandBrakeForce = 0.8,

		-- Traction
--		TractionCurveMax         = 2.04,
--		TractionCurveMin         = 1.943,
--		TractionCurveLateral	 = 16.4,
--		TractionSpringDeltaMax   = 0.128,
--		LowSpeedTractionLossMult = 1.01,
--		CamberStiffnesss		 = 0,
--		TractionBiasFront        = 0.4844,
--		TractionLossMult         = 1.3,

		-- Suspension
--		SuspensionForce       = 3.45,
--		SuspensionCompDamp    = 1.24,
--		SuspensionReboundDamp = 0.72,
--		SuspensionUpperLimit  = 0.068,
--		SuspensionLowerLimit  = -0.121,
--		SuspensionRaise		  = 0.01,
--		SuspensionBiasFront   = 0.464,
--		AntiRollBarForce	  = 0,
--		AntiRollBarBiasFront  = 0.5,
--		RollCentreHeightFront = 0.169,
--		RollCentreHeightRear  = 0.167,

		-- Damage
--		CollisionDamageMult         = 1.0,
--		WeaponDamageMult			= 1.0,
--		DeformationDamageMult		= 2.0,
--		EngineDamageMult			= 15.0,
--		PetrolTankVolume			= 65.0,
--		OilVolume					= 5.0,

		-- Misc
--		SeatOffsetDistX = 0,
--		SeatOffsetDistY = -0.15,
--		SeatOffsetDistZ = 0,
--		MonetaryValue   = 80000,
--		ModelFlags		= '440010',
--		HandlingFlags   = "20002",
--		DamageFlags		= "20",
--		AIHandling		= "AVERAGE",
		
--		SubHandling = {
--			CCarHandlingData {
--				BackEndPopUpCarImpulseMult      = 0.05,
--				BackEndPopUpBuildingImpulseMult = 0.03,
--				BackEndPopUpMaxDeltaSpeed       = 0.6
--			}
--		}
--	},
}