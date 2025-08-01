
ACTION actAborting:
// Everything stops (emergency/error stop)
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_ABORTING, PACKML_MODE_ALL) THEN
    
		IF Status.ModeCurrent = 'Production' THEN
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			gTensionLogic.Status.ProgressBarProcent := 0.0;
			
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
        
		IF Status.ModeCurrent = 'Manual' THEN
			gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis := FALSE;
			gMainLogic.MotorMode.Manual.JogWithTenReg := FALSE;
        
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
    
	END_IF;
END_ACTION