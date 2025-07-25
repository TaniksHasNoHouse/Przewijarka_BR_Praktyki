
PROGRAM _INIT
	MpDataRecorder_0.MpLink := ADR(gDataRecorder); 
	MpDataRecorder_0.Enable := TRUE;
	MpDataRecorder_0.DeviceName := ADR('USER'); 
	MpDataRecorder_0.RecordMode := mpDATA_RECORD_MODE_TRIGGER; 
	MpDataRecorder_0.Record := StartRecording;
	MpDataRecorder_0.Trigger := StartTrigger;
	
	MpDataRegPar_0.MpLink := ADR(gDataRecorder);
	MpDataRegPar_0.Enable := TRUE;
	MpDataRegPar_0.PVName := ADR('gHMI.Charts.Axis1');
	MpDataRegPar_0.Unit := ADR('ChartsDataPage:Unit');
	MpDataRegPar_0.Description := ADR('ChartsDataPage:Description');
END_PROGRAM

PROGRAM _CYCLIC
	MpDataRecorder_0();
	MpDataRegPar_0();
	 
END_PROGRAM

PROGRAM _EXIT
	MpDataRecorder_0.Enable := FALSE;
	MpDataRegPar_0.Enable := FALSE;
	 
END_PROGRAM

