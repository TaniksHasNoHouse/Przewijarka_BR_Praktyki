ACTION actStopping:
// Free braking and transition to stopped
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPING, PACKML_MODE_ALL) THEN
		gMainLogic.MotorMode.Production.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
    
	END_IF;
END_ACTION