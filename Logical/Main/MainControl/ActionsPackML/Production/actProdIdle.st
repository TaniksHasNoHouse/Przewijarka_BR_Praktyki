ACTION actProdIdle:
// Waiting for next button press
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_PRODUCTION) THEN
    
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
//		gMainLogic.MotorMode.Production.Parameter.Tension := 0.0;
		
		IF gMainLogic.Cmd.Start = TRUE THEN
	  		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION