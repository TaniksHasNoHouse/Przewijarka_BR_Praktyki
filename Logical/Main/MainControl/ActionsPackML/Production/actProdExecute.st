
ACTION actProdExecute:
// Wind material 0.9m, then go to completing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_ALL) THEN
    
		// Start winding material
		MainLogic.MotorMode.Production.Cmd.Enable := TRUE;
		MainLogic.MotorMode.Production.Cmd.StartWinding := TRUE;
		MainLogic.MotorMode.Production.Parameter.Distance := 0.9; // 0.9m target
		MainLogic.MotorMode.Production.Parameter.Velocity := 10.0; // Set winding velocity
    
		// Check if target distance reached
		IF MainLogic.MotorMode.Production.Status.ActDistance >= MainLogic.MotorMode.Production.Parameter.Distance THEN
			MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0); // Go to COMPLETING
		END_IF;
    
	END_IF;
END_ACTION