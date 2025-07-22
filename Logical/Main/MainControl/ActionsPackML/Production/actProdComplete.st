ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_PRODUCTION) THEN

		// Clear production variables
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		gMainLogic.MotorMode.Production.Parameter.Tension := 0.0;
		gMainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
    
		// Clear temporary flags
		gMainLogic.MotorMode.Production.Cmd.ResetDistance := FALSE;
		gMainLogic.MotorMode.Production.Cmd.FreeBraking := FALSE;
		gMainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := FALSE;

//		// Keep system powered and ready for next cycle
//		MainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
//		MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
//		MainLogic.MotorMode.Production.Status.TensionStable := FALSE;
    
		// Optional: Add delay for variable clearing
		IF NOT CompleteTimer.IN THEN
			CompleteTimer.IN := TRUE;
			CompleteTimer.PT := gMainLogic.MotorMode.Production.Parameter.CompleteDelayTime;
		END_IF;
    
		CompleteTimer();
    
		// Complete the state and return to IDLE
		IF CompleteTimer.Q THEN
			CompleteTimer.IN := FALSE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION