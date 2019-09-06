-- Coupe Cars
return {
	CHandlingData {
		HandlingName = "COGCABRIO",
		-- Physical
		Mass               = 2550, 
		InitialDragCoeff   = 6.32,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.1, 0.04 },
		InertiaMultiplier  = { 1.22, 1.02,    2.14 },

		-- Transmission
		DriveBiasFront                 = 0.11,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.283,
		DriveInertia                   = 0.97,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 156,
		SteeringLock                   = 33.9,

		-- Brake
		BrakeForce     = 0.531,
		BrakeBiasFront = 0.47188,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 2.053,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.142,
		LowSpeedTractionLossMult = 0.93,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4824,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.46,
		SuspensionUpperLimit  = 0.153,
		SuspensionLowerLimit  = -0.142,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.465,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.353,
		RollCentreHeightRear  = 0.351,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 95000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "EXEMPLAR",
		-- Physical
		Mass               = 2000, 
		InitialDragCoeff   = 6.36,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.34, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.62 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.291,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 166,
		SteeringLock                   = 34.8,

		-- Brake
		BrakeForce     = 0.561,
		BrakeBiasFront = 0.45691,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.25,
		TractionCurveMin         = 2.045,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.13,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4837,
		TractionLossMult         = 1.28,
		
		-- Suspension
		SuspensionForce       = 2.71,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.51,
		SuspensionUpperLimit  = 0.105,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = -0.015,
		SuspensionBiasFront   = 0.469,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.467,
		RollCentreHeightRear  = 0.467,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 55000,
		ModelFlags		= '400010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.055,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FELON",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 5.49,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.155, 0.02 },
		InertiaMultiplier  = { 1.19, 1,    1.97 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.276,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.558,
		BrakeBiasFront = 0.48623,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.1,
		TractionCurveMin         = 1.937,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.71,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.107,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.468,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.497,
		RollCentreHeightRear  = 0.495,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 65000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FELON2",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 5.49,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.155, 0.02 },
		InertiaMultiplier  = { 1.19, 1,    1.97 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.276,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.556,
		BrakeBiasFront = 0.48623,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.15,
		TractionCurveMin         = 1.94,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.61,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.107,
		SuspensionLowerLimit  = -0.136,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.468,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.496,
		RollCentreHeightRear  = 0.494,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 55000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "F620",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 5.81,
		DownforceModifier  = 1.45,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.13, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.66 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.311,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 164,
		SteeringLock                   = 32.9,

		-- Brake
		BrakeForce     = 0.595,
		BrakeBiasFront = 0.517,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.09,
		TractionCurveMin         = 1.98,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4843,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.77,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.087,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = 0.003,
		SuspensionBiasFront   = 0.542,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.4095,
		RollCentreHeightRear  = 0.4075,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 95000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "JACKAL",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 5.68,
		DownforceModifier  = 1.34,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.135, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.62 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.262,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 158,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.501,
		BrakeBiasFront = 0.507,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.10,
		TractionCurveMin         = 1.99,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4838,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.74,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.093,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.458,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.555,
		RollCentreHeightRear  = 0.553,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 65000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ORACLE",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 7.74,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.105, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.73 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.243,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 34,

		-- Brake
		BrakeForce     = 0.531,
		BrakeBiasFront = 0.509,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.91,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.44844,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 2.56,
		SuspensionCompDamp    = 1.37,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.125,
		SuspensionLowerLimit  = -0.136,
		SuspensionRaise		  = 0.001,
		SuspensionBiasFront   = 0.509,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.591,
		RollCentreHeightRear  = 0.489,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.08,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ORACLE2",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 5.76,
		DownforceModifier  = 1.35,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.18, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.72 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.266,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 167,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.539,
		BrakeBiasFront = 0.468,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.922,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 1.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4843,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.68,
		SuspensionCompDamp    = 1.34,
		SuspensionReboundDamp = 0.485,
		SuspensionUpperLimit  = 0.123,
		SuspensionLowerLimit  = -0.136,
		SuspensionRaise		  = 0.001,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.095,
		RollCentreHeightRear  = 0.093,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 55000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.08,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "SENTINEL",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 5.63,
		DownforceModifier  = 1.45,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.08, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    2.12 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.2711,
		DriveInertia                   = 1.02,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 168,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.461,
		BrakeBiasFront = 0.473,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.883,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.125,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4827,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.71,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.51,
		SuspensionUpperLimit  = 0.104,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0.004,
		SuspensionBiasFront   = 0.504,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.262,
		RollCentreHeightRear  = 0.261,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 75000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "SENTINEL2",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 4.3,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 9,
		InitialDriveForce              = 0.6,
		DriveInertia                   = 1.4,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.1,
		InitialDriveMaxFlatVel         = 156,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.52,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 2,
		TractionCurveMin         = 1.92,
		TractionCurveLateral	 = 17,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.6,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 1.3,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.6,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.36,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "WINDSOR",
	
		-- Physical
		Mass               = 2800,
		InitialDragCoeff   = 5.372,
		DownforceModifier  = 1.23,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.03, 0.05 },
		InertiaMultiplier  = { 1.22, 1.02,    1.49 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.26022,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 157,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.534,
		BrakeBiasFront = 0.502,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.36,
		TractionCurveMin         = 1.108,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.142,
		LowSpeedTractionLossMult = 0.322,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831394,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 2.3157,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.46,
		SuspensionUpperLimit  = 0.144,
		SuspensionLowerLimit  = -0.151,
		SuspensionRaise		  = 0.003,
		SuspensionBiasFront   = 0.493,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.254,
		RollCentreHeightRear  = 0.252,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.5,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 105000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "WINDSOR2",
		-- Physical
		Mass               = 3000,
		InitialDragCoeff   = 5.28,
		DownforceModifier  = 1.21,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.221, 0.04 },
		InertiaMultiplier  = { 1.23, 1.02,    1.54 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.260,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 157,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.472,
		BrakeBiasFront = 0.502,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.36,
		TractionCurveMin         = 1.10,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.144,
		LowSpeedTractionLossMult = 0.322,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831394,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.49,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.47,
		SuspensionUpperLimit  = 0.145,
		SuspensionLowerLimit  = -0.152,
		SuspensionRaise		  = 0.003,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.277,
		RollCentreHeightRear  = 0.255,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 95000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ZION",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 5.78,
		DownforceModifier  = 1.39,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.13, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.83 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.279,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 172,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.548,
		BrakeBiasFront = 0.490,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.9,
		TractionCurveMin         = 1.96,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.104,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.206,
		RollCentreHeightRear  = 0.204,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.5,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.25,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 85000,
		ModelFlags		= '400010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ZION2", -- No handling
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 5.78,
		DownforceModifier  = 1.39,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.13, 0.02 },
		InertiaMultiplier  = { 1.18, 1,    1.83 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.279,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 172,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.548,
		BrakeBiasFront = 0.490,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.9,
		TractionCurveMin         = 1.96,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.104,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.206,
		RollCentreHeightRear  = 0.204,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.5,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.25,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 85000,
		ModelFlags		= '400010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FUTO",
		-- Physical
		Mass               = 1050,
		InitialDragCoeff   = 5.69,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0.05, 0.03 },
		InertiaMultiplier  = { 1.15, 0.99,    1.81 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.262,
		DriveInertia                   = 1.04,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.571,
		BrakeBiasFront = 0.491,
		HandBrakeForce = 0.9,

		-- Traction
		TractionCurveMax         = 1.87,
		TractionCurveMin         = 1.623,
		TractionCurveLateral	 = 16.7,
		TractionSpringDeltaMax   = 0.126,
		LowSpeedTractionLossMult = 1.24,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4862,
		TractionLossMult         = 1.16,

		-- Suspension
		SuspensionForce       = 2.91,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.525,
		SuspensionUpperLimit  = 0.086,
		SuspensionLowerLimit  = -0.128,
		SuspensionRaise		  = 0.005,
		SuspensionBiasFront   = 0.473,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.316,
		RollCentreHeightRear  = 0.315,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 15.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 60000,
		ModelFlags		= '440010',
		HandlingFlags   = "1",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
}