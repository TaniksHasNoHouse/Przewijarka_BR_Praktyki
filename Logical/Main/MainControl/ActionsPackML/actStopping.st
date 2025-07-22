ACTION actStopping:
// Free braking and transition to stopped
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPING, PACKML_MODE_ALL) THEN
    
		IF MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode stopping
			MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			MainLogic.MotorMode.Production.Cmd.FreeBraking := TRUE;
			MainLogic.MotorMode.Production.Cmd.EmergencyStop := FALSE;
        
			IF MainLogic.MotorMode.Production.Status.Stopped THEN
				MainLogic.MotorMode.Production.Cmd.FreeBraking := FALSE;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
			END_IF;
        
		ELSIF MainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode stopping - stop all axes
			MainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
        
			// Complete when all axes ready (stopped)
			IF MainLogic.MotorMode.Manual.Axis1.Status.Ready AND 
				MainLogic.MotorMode.Manual.Axis2.Status.Ready AND 
				MainLogic.MotorMode.Manual.Axis3.Status.Ready THEN
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
			END_IF;
		END_IF;
    
	END_IF;
END_ACTION