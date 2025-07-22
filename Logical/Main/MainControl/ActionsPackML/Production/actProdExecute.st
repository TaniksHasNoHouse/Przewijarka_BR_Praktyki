
ACTION actProdExecute:
// Wind material 0.9m, then go to completing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_PRODUCTION) THEN
    
		// Start winding material
//		gMainLogic.MotorMode.Production.Cmd.Enable := TRUE;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.9; // 0.9m target
		gMainLogic.MotorMode.Production.Parameter.Velocity := 10.0; // Set winding velocity
    
		// Check if target distance reached
		IF gMainLogic.MotorMode.Production.Status.ActDistance >= gMainLogic.MotorMode.Production.Parameter.Distance THEN
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
		END_IF;
    
	END_IF;
END_ACTION