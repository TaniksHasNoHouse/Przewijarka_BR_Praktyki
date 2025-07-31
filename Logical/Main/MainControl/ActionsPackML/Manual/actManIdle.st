
ACTION actManIdle:
// Everything can be done - individual axis jogging and tension regulation available
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_MANUAL) THEN
		gHMI.Manual.JogLeftRight.Activate := gMainLogic.MotorMode.Production.Cmd.Home;
		gHMI.Manual.JogLeftRight.Activate := gMainLogic.MotorMode.Production.Cmd.PowerOn;
		
//		gHMI.
		
	END_IF;
END_ACTION