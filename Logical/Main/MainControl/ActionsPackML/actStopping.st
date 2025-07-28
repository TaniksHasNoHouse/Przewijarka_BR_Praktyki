ACTION actStopping:
// Free braking and transition to stopped
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPING, PACKML_MODE_ALL) THEN
    
		IF gMainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode stopping
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			gMainLogic.MotorMode.Production.Cmd.FreeBraking := TRUE;
			gMainLogic.MotorMode.Production.Cmd.EmergencyStop := FALSE;
        
			IF gMainLogic.MotorMode.Production.Status.Stopped THEN
				gMainLogic.MotorMode.Production.Cmd.FreeBraking := FALSE;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
			END_IF;
        
		ELSIF gMainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode stopping - stop all axes
			gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
        
			// Complete when all axes ready (stopped)
			IF gMainLogic.MotorMode.Manual.Axis1.Status.Ready AND 
				gMainLogic.MotorMode.Manual.Axis2.Status.Ready AND 
				gMainLogic.MotorMode.Manual.Axis3.Status.Ready THEN
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
			END_IF;
		END_IF;
    
	END_IF;
END_ACTION