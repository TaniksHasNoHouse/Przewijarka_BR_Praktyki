
ACTION actGetStatus: 
	Status.ModeCurrent := MpPackMLBasicUI_0.Info.ModeCurrent;
	Status.StateCurrent := MpPackMLBasicUI_0.Info.StateCurrent;
	
	IF gTensionLogic.Status.EnableAxis1 = FALSE OR gTensionLogic.Status.EnableAxis2 = FALSE OR gTensionLogic.Status.EnableAxis3 = FALSE THEN
		MpPackMLChangeMode(gPackMLCore, mpPACKML_STATE_ABORTING);
	END_IF;
	
END_ACTION
