ACTION actClearing:
// Acknowledge alarms - only care about them in production
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_CLEARING, PACKML_MODE_ALL) THEN
    
		IF MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode - acknowledge all alarms
		 	MainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := TRUE;
        
			IF NOT MainLogic.MotorMode.Production.Status.AlarmsActive THEN
				MainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := FALSE;
				MainLogic.MotorMode.Production.Cmd.EmergencyStop := FALSE;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
			END_IF;
        
		ELSIF MainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode - don't care about alarms, just complete
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
	END_IF;
END_ACTION