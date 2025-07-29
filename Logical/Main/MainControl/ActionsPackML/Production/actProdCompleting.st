
ACTION actProdCompleting:
// Wait until reaches end and stop everything, go to complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_PRODUCTION) THEN
    	
		IF gMainLogic.MotorMode.Production.Status.ActDistance >= gMainLogic.MotorMode.Production.Parameter.Distance THEN
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
		END_IF;
			
			// Wait for complete stop
//		IF gMainLogic.MotorMode.Production.Status.Stopped AND NOT gMainLogic.MotorMode.Production.Status.Moving THEN
//			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
//			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
//			gMainLogic.MotorMode.Production.Cmd.Enable := FALSE;
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
//		END_IF;
    
	END_IF;
END_ACTION