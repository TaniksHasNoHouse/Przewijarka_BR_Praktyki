ACTION actClearing:

	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_CLEARING, PACKML_MODE_ALL) THEN
    
		IF gHMI.Alarms.PendingAlarms THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		ELSE	
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
        
	END_IF;
END_ACTION