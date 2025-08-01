ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_PRODUCTION) THEN
    
	gTensionLogic.Status.SetDancers := TRUE;
		
		IF gMainLogic.MotorMode.Production.Status.TensionReady THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);	
		END_IF;
    
	END_IF;
END_ACTION