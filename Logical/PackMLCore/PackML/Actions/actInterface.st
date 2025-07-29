ACTION actInterface:
	MpPackMLMode_0.Activate := FALSE;
	MpPackMLMode_1.Activate := FALSE;

	CASE step OF

		0: 
			IF (NOT prevBtn) AND gHMI.ControlBtn.AutoManual THEN
				MpPackMLMode_1.Activate := TRUE;
				step := 1;
			ELSIF prevBtn AND (NOT gHMI.ControlBtn.AutoManual) THEN
				MpPackMLMode_0.Activate := TRUE;
				step := 2;
			END_IF

		1:
			MpPackMLMode_1.Activate := FALSE;
			step := 0;

		2:
			MpPackMLMode_0.Activate := FALSE;
			step := 0;
	END_CASE;
    
	prevBtn := gHMI.ControlBtn.AutoManual;

END_ACTION