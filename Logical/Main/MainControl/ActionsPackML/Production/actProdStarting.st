ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_ALL) THEN
    
		// Enable tension regulator (tensioners rise)
		MainLogic.MotorMode.Production.Cmd.TensionEnable := TRUE;
		MainLogic.MotorMode.Production.Parameter.Tension := 100.0; // Set target tension
		MainLogic.MotorMode.Production.Parameter.TensionTolerance := 5.0;
		MainLogic.MotorMode.Production.Parameter.StabilityTime := T#1000ms;
    
		// Check tension stability
		IF ABS(MainLogic.MotorMode.Production.Status.ActualTension - MainLogic.MotorMode.Production.Parameter.Tension) <= MainLogic.MotorMode.Production.Parameter.TensionTolerance THEN
			IF NOT TensionStabilityTimer.IN THEN
				TensionStabilityTimer.IN := TRUE;
				TensionStabilityTimer.PT := MainLogic.MotorMode.Production.Parameter.StabilityTime;
			END_IF;
		ELSE
			TensionStabilityTimer.IN := FALSE;
		END_IF;
    
		TensionStabilityTimer();
    
		// Complete when stable for required time
		IF TensionStabilityTimer.Q THEN
			TensionStabilityTimer.IN := FALSE;
			MainLogic.MotorMode.Production.Status.TensionStable := TRUE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
	END_IF;
END_ACTION