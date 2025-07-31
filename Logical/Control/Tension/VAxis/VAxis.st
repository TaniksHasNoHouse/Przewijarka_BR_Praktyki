
PROGRAM _INIT
	MpAxisBasicMaster.MpLink := ADR(gAxisMaster);
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMasterPar.Position := 100.0;
	MpAxisBasicMasterPar.Distance := 1000.0;
	MpAxisBasicMasterPar.Velocity := 500.0;
	MpAxisBasicMasterPar.Acceleration := 100.0;
	MpAxisBasicMasterPar.Deceleration := 100.0;
	MpAxisBasicMasterPar.Jog.Velocity := 500.0;
	MpAxisBasicMasterPar.Jog.Acceleration := 10.0;
	MpAxisBasicMasterPar.Jog.Deceleration := 10.0;
	MpAxisBasicMaster.Parameters := ADR(MpAxisBasicMasterPar);
	PowerStep := POWER_INIT;
END_PROGRAM

PROGRAM _CYCLIC

	MpAxisBasicMaster.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
	MpAxisBasicMaster.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	MpAxisBasicMaster.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	MpAxisBasicMaster.MoveAdditive := gMainLogic.MotorMode.Production.Cmd.StartWinding;
	MpAxisBasicMaster.MoveVelocity := gMainLogic.MotorMode.Manual.JogWithTenReg;
	MpAxisBasicMaster.Stop := gMainLogic.MotorMode.Production.Cmd.EmergencyStop;

	MpAxisBasicMasterPar.Velocity := gMainLogic.MotorMode.Production.Parameter.Velocity * 1000.0/ 60.0;
	MpAxisBasicMasterPar.Distance := gMainLogic.MotorMode.Production.Parameter.Distance * 1000.0;
	
	LineVelocityInMeters := MpAxisBasicMaster.Velocity * 60.0 / 1000.0;
	
	gTensionLogic.Parameter.GroupLineVelocity := LineVelocityInMeters;
	gTensionLogic.Status.MasterIsHomed := MpAxisBasicMaster.IsHomed;
	gTensionLogic.Status.MasterIsPowerOn := MpAxisBasicMaster.PowerOn;
	gMainLogic.MotorMode.Production.Status.ActVelocity := LineVelocityInMeters;
	gTensionLogic.Status.ErrorExist := MpAxisBasicMaster.Error;
	gTensionLogic.Status.MoveDone := MpAxisBasicMaster.MoveDone;
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	MpAxisBasicMaster();
END_PROGRAM

