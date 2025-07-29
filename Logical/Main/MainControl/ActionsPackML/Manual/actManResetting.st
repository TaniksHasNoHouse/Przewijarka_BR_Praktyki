
ACTION actManResetting:
// Nothing is powered, just go to IDLE
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_MANUAL) THEN
    
		// Completely disable all axes
		gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
		gMainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
		gMainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
		gMainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
    
		// Go directly to IDLE
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
    
	END_IF;
END_ACTION