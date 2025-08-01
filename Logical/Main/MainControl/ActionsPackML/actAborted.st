ACTION actAborted:
// Just pass to clearing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTED, PACKML_MODE_ALL) THEN
		IF NOT gHMI.Alarms.PendingAlarms THEN
			gMainLogic.MotorMode.Production.Cmd.Reset := FALSE;
	  		MpPackMLBasicUIConnect.StateControl.Clear := TRUE;
		END_IF;
		
	END_IF;
END_ACTION