
ACTION actAborting:
// Everything stops (emergency/error stop)
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTING, PACKML_MODE_ALL) THEN
    
		IF gMainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode aborting
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			gMainLogic.MotorMode.Production.Cmd.EmergencyStop := TRUE;
			gMainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
			gMainLogic.MotorMode.Production.Cmd.Enable := FALSE;
        
			IF gMainLogic.MotorMode.Production.Status.EmergencyStopped THEN
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
			END_IF;
        
		ELSIF gMainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode aborting - emergency stop all axes
			gMainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
			gMainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
			gMainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
			gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
        
			// Complete immediately in manual
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
    
	END_IF;
END_ACTION