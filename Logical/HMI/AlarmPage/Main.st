

PROGRAM _INIT
	(* MpLink przekazujemy przez referencjê ADR *)
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
END_PROGRAM

PROGRAM _CYCLIC
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
	//Power supply alarm
	IF gHMI.ModuleOK.PowerSupply = FALSE THEN
	  MpAlarmXSet(gAlarmXCore, 'ModuleOKErrorPS');
	END_IF;
	IF gHMI.ModuleOK.PowerSupply THEN
		MpAlarmXReset(gAlarmXCore, 'ModuleOKErrorPS');
	END_IF;
	
	//Analog input alarm
	IF gHMI.ModuleOK.AnalogInput = FALSE THEN
		MpAlarmXSet(gAlarmXCore, 'ModuleOKErrorAI');
	END_IF;
	IF gHMI.ModuleOK.AnalogInput THEN
		MpAlarmXReset(gAlarmXCore, 'ModuleOKErrorAI');
	END_IF;
	
	//System bus transmitter alarm
	IF gHMI.ModuleOK.SystemBusTransmitter = FALSE THEN
		MpAlarmXSet(gAlarmXCore, 'ModuleOKErrorBT');
	END_IF;
	IF gHMI.ModuleOK.SystemBusTransmitter THEN
		MpAlarmXReset(gAlarmXCore, 'ModuleOKErrorBT');
	END_IF;
	
	//Control keypad alarm
	IF gHMI.ModuleOK.ControlKeypad = FALSE THEN
		MpAlarmXSet(gAlarmXCore, 'ModuleOKError4XP');
	END_IF;
	IF gHMI.ModuleOK.ControlKeypad THEN
		MpAlarmXReset(gAlarmXCore, 'ModuleOKError4XP');
	END_IF;
	
	MpAlarmXCore_0();
END_PROGRAM

PROGRAM _EXIT
	(* W sekcji exit trzeba wywo³aæ/wy³aczyæ blok funkcyjny (Enable := FALSE) *)
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := FALSE);
END_PROGRAM

