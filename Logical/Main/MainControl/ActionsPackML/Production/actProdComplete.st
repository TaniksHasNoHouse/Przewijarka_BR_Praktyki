ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_PRODUCTION) THEN
		
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
	END_IF;
END_ACTION