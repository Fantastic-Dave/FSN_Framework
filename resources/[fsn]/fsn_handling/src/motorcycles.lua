-- Motorcycles
return {
	CHandlingData {
		HandlingName = "AKUMA",
		-- Physical
		Mass               = 250,
		InitialDragCoeff   = 2.45,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    0.01, -0.15 },
		InertiaMultiplier  = { 1, 1,     0.8 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.34,
		DriveInertia                   = 1.3,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.65,
		BrakeBiasFront = 0.72,
		HandBrakeForce = 0.1,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.76,
		TractionCurveLateral     = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss         = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 2,

		-- Suspension
		SuspensionForce       = 7.6,
		SuspensionCompDamp    = 2.5,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.12,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise       = 0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce      = 0,
		AntiRollBarBiasFront  = 0,
		RollCentreHeightFront = 0.184,
		RollCentreHeightRear  = 0.184,

		-- Damage
		CollisionDamageMult   = 1.0,
		WeaponDamageMult	  = 1.0,
		DeformationDamageMult = 2.0,
		EngineDamageMult	  = 12.0,
		PetrolTankVolume	  = 60,
		OilVolume			  = 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 20000,
		ModelFlags      = "440010",
		HandlingFlags   = "20100",
		DamageFlags     = "20",
		AIHandling      = "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
}