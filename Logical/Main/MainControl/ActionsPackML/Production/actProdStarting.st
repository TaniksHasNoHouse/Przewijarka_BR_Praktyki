ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_PRODUCTION) THEN
    
		// Enable tension regulator (tensioners rise)
		gMainLogic.MotorMode.Production.Cmd.TensionEnable := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Tension := 50.0; // Set target tension
		gMainLogic.MotorMode.Production.Parameter.TensionTolerance := 1.0;
    
		// Check tension stability
		IF ABS(gMainLogic.MotorMode.Production.Status.ActualTension - gMainLogic.MotorMode.Production.Parameter.Tension) <= gMainLogic.MotorMode.Production.Parameter.TensionTolerance THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION