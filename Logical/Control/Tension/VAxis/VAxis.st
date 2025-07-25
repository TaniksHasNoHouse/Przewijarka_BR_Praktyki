
PROGRAM _INIT
	MpAxisBasicMaster.MpLink := ADR(gAxisMaster);
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMasterPar.Position := 100.0;
	MpAxisBasicMasterPar.Jog.Velocity := 10.0;
	MpAxisBasicMasterPar.Jog.Acceleration := 100.0;
	MpAxisBasicMasterPar.Jog.Deceleration := 100.0;
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
	LineVelocityInMeters := MpAxisBasicMasterPar.Jog.Velocity  * 60.0 / 1000.0;
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	 
END_PROGRAM

