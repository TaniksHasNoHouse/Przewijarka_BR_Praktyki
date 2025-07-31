ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_PRODUCTION) THEN
		
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;

	END_IF;
END_ACTION