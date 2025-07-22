ACTION actStopped:
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPED, PACKML_MODE_ALL) THEN
    
		IF MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
			// Production mode - ensure everything is off
			MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			MainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
			MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
        
		ELSIF MainLogic.Mode = PACKML_MODE_MANUAL THEN
			// Manual mode - disable all axes completely
			MainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
			MainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
			MainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
			MainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
			MainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
		END_IF;
    
	END_IF;
END_ACTION