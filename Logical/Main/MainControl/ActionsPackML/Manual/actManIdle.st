
ACTION actManualIdle:
// Everything can be done - individual axis jogging and tension regulation available
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_ALL) AND MainLogic.Mode = PACKML_MODE_MANUAL THEN
    
		// Enable individual axis control capabilities
		// Actual jogging commands come from HMI:
		// MainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis
		// MainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis  
		// MainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis
		// MainLogic.MotorMode.Manual.JogWithTenReg
    
		// Stay in idle - manual operations controlled by HMI
    
	END_IF;
END_ACTION