
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
	MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
	MpAxisBasicMaster.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	MpAxisBasicMaster.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	MpAxisBasicMaster.JogPositive := gMainLogic.MotorMode.Production.Cmd.StartWinding;
	MpAxisBasicMaster.Stop := gMainLogic.MotorMode.Production.Cmd.EmergencyStop;
	
	LineVelocityInMeters := MpAxisBasicMaster.Velocity * 60.0 / 1000.0;
	
	gTensionLogic.Parameter.GroupLineVelocity := LineVelocityInMeters;
	
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	MpAxisBasicMaster();
END_PROGRAM

