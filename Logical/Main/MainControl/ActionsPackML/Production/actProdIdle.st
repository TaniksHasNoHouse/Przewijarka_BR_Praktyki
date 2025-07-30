ACTION actProdIdle:
// Waiting for next button press
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_PRODUCTION) THEN
		IF gMainLogic.Cmd.Start = TRUE THEN
	  		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION