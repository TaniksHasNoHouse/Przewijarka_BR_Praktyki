
PROGRAM _INIT
	(* Insert code here *)
	MpDataRecorder_0.MpLink := ADR(gDataRecorder); 
	MpDataRecorder_0.Enable := TRUE;
	MpDataRecorder_0.DeviceName := ADR('USER'); 
	MpDataRecorder_0.RecordMode := mpDATA_RECORD_MODE_TRIGGER; 
	MpDataRecorder_0.Record := StartRecording;
	MpDataRecorder_0.Trigger := StartRecording;
	
	MpDataRegPar_0.MpLink := ADR(gDataRecorder);
	MpDataRegPar_0.Enable := TRUE;
	MpDataRegPar_0.PVName := ADR(StartRecording(*zmienna do monitorowania*));
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	MpDataRecorder_0();
	MpDataRegPar_0();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	MpDataRecorder_0.Enable := FALSE;
	MpDataRegPar_0.Enable := FALSE;
END_PROGRAM

