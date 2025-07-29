
PROGRAM _INIT
	MpAxisBasicMaster.MpLink := ADR(gAxisMaster);
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMasterPar.Position := 100.0;
	MpAxisBasicMasterPar.Distance := 1000.0;
	MpAxisBasicMasterPar.Velocity := 500.0;
	MpAxisBasicMasterPar.Acceleration := 10.0;
	MpAxisBasicMasterPar.Deceleration := 10.0;
	MpAxisBasicMasterPar.Jog.Velocity := 500.0;
	MpAxisBasicMasterPar.Jog.Acceleration := 10.0;
	MpAxisBasicMasterPar.Jog.Deceleration := 10.0;
	MpAxisBasicMaster.Parameters := ADR(MpAxisBasicMasterPar);
END_PROGRAM

PROGRAM _CYCLIC
	MpAxisBasicMaster.Enable := gMainLogic.MotorMode.Production.Cmd.Enable;
	MpAxisBasicMaster.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	CASE PowerState OF

		POWER_INIT:
			MpAxisBasicMaster.Power := FALSE;
			PowerState := POWER_REQUEST_ON;

		POWER_REQUEST_ON:
			MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
			IF MpAxisBasicMaster.Power THEN
				PowerState := POWER_CHECK_ON;
			END_IF;
			
		POWER_CHECK_ON:
			IF MpAxisBasicMaster.PowerOn THEN
				PowerState := POWER_DONE;
			ELSE
				MpAxisBasicMaster.Power := NOT MpAxisBasicMaster.Power;
			END_IF;
			
		POWER_DONE:
			MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;

	END_CASE
	MpAxisBasicMaster.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	MpAxisBasicMaster.MoveAdditive := gMainLogic.MotorMode.Production.Cmd.StartWinding;
	MpAxisBasicMaster.Stop := gMainLogic.MotorMode.Production.Cmd.EmergencyStop;
	
	LineVelocityInMeters := MpAxisBasicMaster.Velocity * 60.0 / 1000.0;
	
	gTensionLogic.Parameter.GroupLineVelocity := LineVelocityInMeters;
	gTensionLogic.Status.MasterIsHomed := MpAxisBasicMaster.IsHomed;
	gTensionLogic.Status.MasterIsPowerOn := MpAxisBasicMaster.PowerOn;
	gMainLogic.MotorMode.Production.Status.ActVelocity := LineVelocityInMeters;
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	MpAxisBasicMaster();
END_PROGRAM

