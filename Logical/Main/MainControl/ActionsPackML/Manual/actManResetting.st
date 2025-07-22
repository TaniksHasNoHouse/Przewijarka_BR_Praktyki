
ACTION actManResetting:
// Nothing is powered, just go to IDLE
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_ALL) AND MainLogic.Mode = PACKML_MODE_MANUAL THEN
    
		// Completely disable all axes
		MainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
		MainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
		MainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
		MainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
		MainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
		MainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
		MainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
    
		// Go directly to IDLE
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
    
	END_IF;
END_ACTION