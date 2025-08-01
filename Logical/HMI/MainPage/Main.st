
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	IF gTensionLogic.Status.EnableAxis1 = FALSE OR gTensionLogic.Status.EnableAxis2 = FALSE OR gTensionLogic.Status.EnableAxis3 = FALSE THEN
		aBORT := TRUE;
	END_IF;
	
	PhysicalBtn.Manual.ManProd := FALSE;
	gHMI.Recipe.EnableEditing := FALSE;
	
	IF Status.StateCurrent = 'Stopped'
	OR Status.StateCurrent = 'Aborted' THEN
		PhysicalBtn.Manual.ManProd := TRUE;
	END_IF;
	IF Status.StateCurrent = 'Idle' 
	OR Status.StateCurrent = 'Stopped'
	OR Status.StateCurrent = 'Aborted' THEN
		gHMI.Recipe.EnableEditing := TRUE;
	END_IF;
	
	actBtnAssignment;
	actBasicColors;
	
	IF Status.ModeCurrent = 'Production' THEN
		actProdColors;
	END_IF;
	
	IF Status.ModeCurrent = 'Manual' THEN
		actManualMode;
	END_IF;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

