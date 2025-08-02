ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_PRODUCTION) THEN
    
	gTensionLogic.Status.SetDancers := TRUE;
		IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		END_IF;
		IF gMainLogic.MotorMode.Production.Status.TensionReady THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);	
		END_IF;
		
	END_IF;
END_ACTION