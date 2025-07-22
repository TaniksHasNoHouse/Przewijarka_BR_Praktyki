ACTION actAborted:
// Just pass to clearing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTED, PACKML_MODE_ALL) THEN
		// Stay in aborted - PackML will handle Clear command from HMI
		// No specific action needed, just wait for clear
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
	END_IF;
END_ACTION