
ACTION actGetStatus: 
	Status.ModeCurrent := MpPackMLBasicUI_0.Info.ModeCurrent;
	Status.StateCurrent := MpPackMLBasicUI_0.Info.StateCurrent;
	
	IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
		MpPackMLChangeMode(gPackMLCore, mpPACKML_STATE_ABORTING);
		bulwielki := TRUE;
		
	END_IF;
	
END_ACTION
