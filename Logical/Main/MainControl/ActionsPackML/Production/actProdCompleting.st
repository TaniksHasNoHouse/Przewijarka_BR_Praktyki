
ACTION actProdCompleting:
// Wait until reaches end and stop everything, go to complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_PRODUCTION) THEN
    
		// Stop all movement
		gMainLogic.MotorMode.Production.Cmd.FreeBraking := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		gMainLogic.MotorMode.Production.Cmd.Enable := FALSE;
    
		// Wait for complete stop
		IF gMainLogic.MotorMode.Production.Status.Stopped AND NOT gMainLogic.MotorMode.Production.Status.Moving THEN
			IF NOT CompletingTimer.IN THEN
				CompletingTimer.IN := TRUE;
				CompletingTimer.PT := gMainLogic.MotorMode.Production.Parameter.StopDelayTime;
			END_IF;
		END_IF;
    
		CompletingTimer();
    
		// Complete when fully stopped
		IF CompletingTimer.Q THEN
			CompletingTimer.IN := FALSE;
			gMainLogic.MotorMode.Production.Cmd.FreeBraking := FALSE;
			gMainLogic.MotorMode.Production.Cmd.ResetDistance := TRUE; // Reset for next cycle
			gMainLogic.Process.CycleCount := gMainLogic.Process.CycleCount + 1; // Increment cycle counter
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
		IF gMainLogic.MotorMode.Production.Cmd.ResetDistance THEN
			gMainLogic.MotorMode.Production.Cmd.ResetDistance := FALSE;
		END_IF;
    
	END_IF;
END_ACTION