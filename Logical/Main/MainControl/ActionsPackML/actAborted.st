ACTION actAborted:
// Just pass to clearing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTED, PACKML_MODE_ALL) THEN
		IF gHMI.Alarms.PendingAlarms = FALSE THEN
	  		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
		
	END_IF;
END_ACTION