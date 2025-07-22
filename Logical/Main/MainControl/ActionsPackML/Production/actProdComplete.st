ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_ALL) THEN

		// Clear production variables
		MainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		MainLogic.MotorMode.Production.Parameter.Tension := 0.0;
		MainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
    
		// Clear temporary flags
		MainLogic.MotorMode.Production.Cmd.ResetDistance := FALSE;
		MainLogic.MotorMode.Production.Cmd.FreeBraking := FALSE;
		MainLogic.MotorMode.Production.Cmd.AcknowledgeAlarms := FALSE;
    
		// Keep system powered and ready for next cycle
		MainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
		MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
		MainLogic.MotorMode.Production.Status.TensionStable := FALSE;
    
		// Optional: Add delay for variable clearing
		IF NOT CompleteTimer.IN THEN
			CompleteTimer.IN := TRUE;
			CompleteTimer.PT := MainLogic.MotorMode.Production.Parameter.CompleteDelayTime;
		END_IF;
    
		CompleteTimer();
    
		// Complete the state and return to IDLE
		IF CompleteTimer.Q THEN
			CompleteTimer.IN := FALSE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
	END_IF;
END_ACTION