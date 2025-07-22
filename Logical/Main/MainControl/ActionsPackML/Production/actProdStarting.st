ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_PRODUCTION) THEN
    
		// Enable tension regulator (tensioners rise)
		gMainLogic.MotorMode.Production.Cmd.TensionEnable := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Tension := 100.0; // Set target tension
		gMainLogic.MotorMode.Production.Parameter.TensionTolerance := 5.0;
		gMainLogic.MotorMode.Production.Parameter.StabilityTime := T#1000ms;
    
		// Check tension stability
		IF ABS(gMainLogic.MotorMode.Production.Status.ActualTension - gMainLogic.MotorMode.Production.Parameter.Tension) <= gMainLogic.MotorMode.Production.Parameter.TensionTolerance THEN
			IF NOT TensionStabilityTimer.IN THEN
				TensionStabilityTimer.IN := TRUE;
				TensionStabilityTimer.PT := gMainLogic.MotorMode.Production.Parameter.StabilityTime;
			END_IF;
		ELSE
			TensionStabilityTimer.IN := FALSE;
		END_IF;
    
		TensionStabilityTimer();
		
		// Complete when stable for required time
		IF TensionStabilityTimer.Q THEN
			TensionStabilityTimer.IN := FALSE;
			gMainLogic.MotorMode.Production.Status.TensionStable := TRUE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION