
PROGRAM _INIT
	MpAxisBasicMaster.MpLink := ADR(gAxisMaster);
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMasterPar.Position := 100.0;
	MpAxisBasicMasterPar.Distance := 1000.0;
	MpAxisBasicMasterPar.Velocity := 1000.0;
	MpAxisBasicMasterPar.Acceleration := 5.0;
	MpAxisBasicMasterPar.Deceleration := 5.0;
	MpAxisBasicMaster.Parameters := ADR(MpAxisBasicMasterPar);
END_PROGRAM

PROGRAM _CYCLIC
	IF MpAxisBasicMaster.Info.CommunicationReady AND MpAxisBasicMaster.Info.ReadyToPowerOn THEN
		MpAxisBasicMaster.Power := TRUE;
	END_IF;
	IF MpAxisBasicMaster.PowerOn THEN
		MpAxisBasicMaster.Home := TRUE;
	END_IF;
	IF MpAxisBasicMaster.IsHomed THEN
		MpAxisBasicMaster.Home := FALSE;
	END_IF;
	LineVelocityInMeters := MpAxisBasicMaster.Velocity * 60.0 / 1000.0;
	
	gTensionLogic.Parameter.GroupLineVelocity := LineVelocityInMeters;
	
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	MpAxisBasicMaster();
END_PROGRAM

