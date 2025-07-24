
PROGRAM _INIT
	MpAxisBasicMaster.MpLink := ADR(gAxisMaster);
	MpAxisBasicMaster.Enable := TRUE;
	MpAxisBasicMasterPar.Position := 100.0;
	MpAxisBasicMasterPar.Velocity := 5.0;
	MpAxisBasicMasterPar.Acceleration := 50.0;
	MpAxisBasicMasterPar.Deceleration := 50.0;
	MpAxisBasicMaster.Parameters := ADR(MpAxisBasicMasterPar);
END_PROGRAM

PROGRAM _CYCLIC
	gTension.GroupLineVelocity := MpAxisBasicMaster.Velocity;
	MpAxisBasicMaster();
	
END_PROGRAM

PROGRAM _EXIT
	MpAxisBasicMaster.Enable := FALSE;
	 
END_PROGRAM

