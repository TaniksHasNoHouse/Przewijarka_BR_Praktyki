
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	IF gTensionLogic.Status.EnableAxis1 = FALSE OR gTensionLogic.Status.EnableAxis2 = FALSE OR gTensionLogic.Status.EnableAxis3 = FALSE THEN
		aBORT := TRUE;
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

