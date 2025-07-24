
PROGRAM _INIT
	Charts.Dancer1;
	Charts.Dancer2;
	Charts.Vtape;
	Charts.Axis1;
	Charts.Axis2;
	Charts.Axis3;
	
	MpDataRecorder_0.MpLink := ADR(gDataRecorder); 
	MpDataRecorder_0.Enable := TRUE;
	MpDataRecorder_0.DeviceName := ADR('USER'); 
	MpDataRecorder_0.RecordMode := mpDATA_RECORD_MODE_TRIGGER; 
	MpDataRecorder_0.Record := StartRecording;
	MpDataRecorder_0.Trigger := StartRecording;
	
	MpDataRegPar_0.MpLink := ADR(gDataRecorder);
	MpDataRegPar_0.Enable := TRUE;
	MpDataRegPar_0.PVName := ADR(Charts.Dancer1);
	MpDataRegPar_0.PVName := ADR(Charts.Dancer2);
	MpDataRegPar_0.PVName := ADR(Charts.Vtape);
	MpDataRegPar_0.PVName := ADR(Charts.Axis1);
	MpDataRegPar_0.PVName := ADR(Charts.Axis2);
	MpDataRegPar_0.PVName := ADR(Charts.Axis3);
END_PROGRAM

PROGRAM _CYCLIC
	MpDataRecorder_0();
	MpDataRegPar_0();
	 
END_PROGRAM

PROGRAM _EXIT
	MpDataRecorder_0.Enable := FALSE;
	MpDataRegPar_0.Enable := FALSE;
	 
END_PROGRAM

