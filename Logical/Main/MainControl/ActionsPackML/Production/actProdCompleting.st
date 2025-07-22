
ACTION actProdCompleting:
// Wait until reaches end and stop everything, go to complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_ALL) THEN
    
		// Stop all movement
		MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		MainLogic.MotorMode.Production.Cmd.Enable := FALSE;
    
		// Wait for complete stop
		IF MainLogic.MotorMode.Production.Status.Stopped AND NOT MainLogic.MotorMode.Production.Status.Moving THEN
			IF NOT CompletingTimer.IN THEN
				CompletingTimer.IN := TRUE;
				CompletingTimer.PT := MainLogic.MotorMode.Production.Parameter.StopDelayTime;
			END_IF;
		END_IF;
    
		CompletingTimer();
    
		// Complete when fully stopped
		IF CompletingTimer.Q THEN
			CompletingTimer.IN := FALSE;
			MainLogic.MotorMode.Production.Cmd.ResetDistance := TRUE; // Reset for next cycle
			MainLogic.Process.CycleCount := MainLogic.Process.CycleCount + 1; // Increment cycle counter
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
		IF MainLogic.MotorMode.Production.Cmd.ResetDistance THEN
			MainLogic.MotorMode.Production.Cmd.ResetDistance := FALSE;
		END_IF;
    
	END_IF;
END_ACTION