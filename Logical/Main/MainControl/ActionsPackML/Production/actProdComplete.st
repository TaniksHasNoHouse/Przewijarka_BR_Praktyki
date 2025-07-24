ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_PRODUCTION) THEN

		// Clear production variables
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
    
//		// Clear temporary flags
//		gMainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := FALSE;

//		// Keep system powered and ready for next cycle
//		MainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
//		MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
//		MainLogic.MotorMode.Production.Status.TensionStable := FALSE;
    
	END_IF;
END_ACTION