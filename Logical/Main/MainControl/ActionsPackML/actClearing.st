ACTION actClearing:

	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_CLEARING, PACKML_MODE_ALL) THEN
    
		IF gMainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			IF NOT gMainLogic.MotorMode.Production.Status.AlarmsActive THEN
				gMainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := FALSE;
				gMainLogic.MotorMode.Production.Cmd.EmergencyStop := FALSE;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
			END_IF;
        
		ELSIF gMainLogic.Mode = PACKML_MODE_MANUAL THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
    
	END_IF;
END_ACTION