
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
	PowerStep := POWER_INIT;
END_PROGRAM

PROGRAM _CYCLIC
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMaster.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	CASE PowerStep OF

		POWER_INIT:
			MpAxisBasicMaster.Power := FALSE;
			PowerStep := POWER_REQUEST_ON;

		POWER_REQUEST_ON:
			MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
			IF MpAxisBasicMaster.Power THEN
				PowerStep := POWER_CHECK_ON;
			END_IF;
			
		POWER_CHECK_ON:
			IF MpAxisBasicMaster.PowerOn THEN
				PowerStep := POWER_DONE;
			ELSE
				MpAxisBasicMaster.Power := NOT MpAxisBasicMaster.Power;
			END_IF;
			
		POWER_DONE:
			MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;

	END_CASE
	MpAxisBasicMaster.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	MpAxisBasicMaster.MoveAdditive := gMainLogic.MotorMode.Production.Cmd.StartWinding;
	MpAxisBasicMaster.MoveVelocity := gMainLogic.MotorMode.Manual.JogWithTenReg;
	MpAxisBasicMaster.Stop := gMainLogic.MotorMode.Production.Cmd.EmergencyStop;
	
	IF (MpAxisBasicMasterPar.Velocity <> PrevVelocity) OR (MpAxisBasicMasterPar.Distance <> PrevDistance) THEN
		UpdateTrigger := TRUE;
	ELSE
		UpdateTrigger := FALSE;
	END_IF

	UpdateEdge := UpdateTrigger AND NOT UpdateEdge;
	
	IF gMainLogic.MotorMode.Production.Parameter.Distance >= 0.0 OR gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir >=0 THEN
		MpAxisBasicMasterPar.Velocity := gMainLogic.MotorMode.Production.Parameter.Velocity;
	ELSIF gMainLogic.MotorMode.Production.Parameter.Distance <= 0.0 OR gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir <=0 THEN
		MpAxisBasicMasterPar.Velocity := - gMainLogic.MotorMode.Production.Parameter.Velocity;
	END_IF;
	MpAxisBasicMasterPar.Distance := gMainLogic.MotorMode.Production.Parameter.Distance;
	
	MpAxisBasicMaster.Update := UpdateEdge;
	
	LineVelocityInMeters := MpAxisBasicMaster.Velocity * 60.0 / 1000.0;
	
	gTensionLogic.Parameter.GroupLineVelocity := LineVelocityInMeters;
	gTensionLogic.Status.MasterIsHomed := MpAxisBasicMaster.IsHomed;
	gTensionLogic.Status.MasterIsPowerOn := MpAxisBasicMaster.PowerOn;
	gMainLogic.MotorMode.Production.Status.ActVelocity := LineVelocityInMeters;
	gTensionLogic.Status.ErrorExist := MpAxisBasicMaster.Error;
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	MpAxisBasicMaster();
END_PROGRAM

