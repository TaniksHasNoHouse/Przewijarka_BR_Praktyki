
PROGRAM _INIT
	MpDataRecorder_0.MpLink := ADR(gDataRecorder); 
	MpDataRecorder_0.Enable := TRUE;
	MpDataRecorder_0.DeviceName := ADR('DATA'); 
	MpDataRecorder_0.RecordMode := mpDATA_RECORD_MODE_VALUE;
	MpDataRegPar_0.MpLink := ADR(gDataRecorder);
	MpDataRegPar_0.PVName := ADR('gHMI.Charts.Axis1');
	MpDataRegPar_0.Unit := ADR('m/min');
	MpDataRegPar_0.Description := ADR('Axis1 speed');
	
	MpDataRegPar_1.MpLink := ADR(gDataRecorder);
	MpDataRegPar_1.PVName := ADR('gHMI.Charts.Axis2');
	MpDataRegPar_1.Unit := ADR('m/min');
	MpDataRegPar_1.Description := ADR('Axis2 speed');
	
	MpDataRegPar_2.MpLink := ADR(gDataRecorder);
	MpDataRegPar_2.PVName := ADR('gHMI.Charts.Axis3');
	MpDataRegPar_2.Unit := ADR('m/min');
	MpDataRegPar_2.Description := ADR('Axis3 speed');
	
	MpDataRegPar_3.MpLink := ADR(gDataRecorder);
	MpDataRegPar_3.PVName := ADR('gHMI.Charts.Dancer1');
	MpDataRegPar_3.Unit := ADR('mm');
	MpDataRegPar_3.Description := ADR('Dancer 1 position');
	
	MpDataRegPar_4.MpLink := ADR(gDataRecorder);
	MpDataRegPar_4.PVName := ADR('gHMI.Charts.Dancer2');
	MpDataRegPar_4.Unit := ADR('mm');
	MpDataRegPar_4.Description := ADR('Dancer 2 position');
	
END_PROGRAM

PROGRAM _CYCLIC
	IF gHMI.Recipe.CurrentRecipe.DataRegistration THEN
		MpDataRecorder_0.Enable := TRUE;
		MpDataRecorder_0.Record := TRUE;
	ELSE
		MpDataRecorder_0.Enable := FALSE;
		MpDataRecorder_0.Record := FALSE;
	END_IF;
	
	IF gHMI.Charts.Record.Axis1 THEN
		MpDataRegPar_0.Enable := TRUE;
	ELSE
		MpDataRegPar_0.Enable := FALSE;
	END_IF;
	
	IF gHMI.Charts.Record.Axis2 THEN
		MpDataRegPar_1.Enable := TRUE;
	ELSE
		MpDataRegPar_1.Enable := FALSE;
	END_IF;
	
	IF gHMI.Charts.Record.Axis3 THEN
		MpDataRegPar_2.Enable := TRUE;
	ELSE
		MpDataRegPar_2.Enable := FALSE;
	END_IF;
	
	IF gHMI.Charts.Record.Dancer1 THEN
		MpDataRegPar_3.Enable := TRUE;
	ELSE
		MpDataRegPar_3.Enable := FALSE;
	END_IF;
	
	IF gHMI.Charts.Record.Dancer2 THEN
		MpDataRegPar_4.Enable := TRUE;
	ELSE
		MpDataRegPar_4.Enable := FALSE;
	END_IF;
	
	MpDataRecorder_0();
	MpDataRegPar_0();
	MpDataRegPar_1();
	MpDataRegPar_2();
	MpDataRegPar_3();
	MpDataRegPar_4();
END_PROGRAM

PROGRAM _EXIT
	MpDataRecorder_0.Enable := FALSE;
	MpDataRegPar_0.Enable := FALSE;
	MpDataRegPar_1.Enable := FALSE;
	MpDataRegPar_2.Enable := FALSE;
	MpDataRegPar_3.Enable := FALSE;
	MpDataRegPar_4.Enable := FALSE;
END_PROGRAM

