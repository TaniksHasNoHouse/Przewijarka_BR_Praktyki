ACTION actInterface:
	IF MpPackMLCore_0.StateCurrent = mpPACKML_STATE_STOPPED THEN
		MpPackMLMode_0.Start := TRUE;
		IF gHMI.ControlBtn.AutoManual THEN
			MpPackMLMode_0.ModeID := PACKML_MODE_PRODUCTION;
		ELSE
			MpPackMLMode_0.ModeID := PACKML_MODE_MANUAL;
		END_IF;
	ELSE
		MpPackMLMode_0.Start := FALSE;
	END_IF;
END_ACTION
