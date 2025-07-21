
ACTION actAborted: 
	// acknowlege all na liscie alarmow powoduje przejscie do clearing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTED, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
END_ACTION
