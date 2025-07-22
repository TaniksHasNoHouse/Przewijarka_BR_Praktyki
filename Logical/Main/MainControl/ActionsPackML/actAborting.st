
ACTION actAborting:
// Everything stops (emergency/error stop)
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTING, PACKML_MODE_ALL) THEN
    
		IF MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode aborting
			MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			MainLogic.MotorMode.Production.Cmd.EmergencyStop := TRUE;
			MainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
			MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
        
			IF MainLogic.MotorMode.Production.Status.EmergencyStopped THEN
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
			END_IF;
        
		ELSIF MainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode aborting - emergency stop all axes
			MainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis := FALSE;
			MainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
        
			// Complete immediately in manual
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
	END_IF;
END_ACTION