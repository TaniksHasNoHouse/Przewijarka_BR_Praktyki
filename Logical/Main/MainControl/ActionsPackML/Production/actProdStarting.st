ACTION actProdStarting: 
// Turn on tension regulator, achieve and maintain stable tension for 1s
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_ALL) THEN
//    
//		// Enable tension regulator (tensioners rise)
//		Control.Cmd.TensionEnable := TRUE;
//		Control.Cmd.SetTension := Parameters.TARGET_TENSION;
//    
//		// Check tension stability
//		IF ABS(Control.Status.ActualTension - Parameters.TARGET_TENSION) <= Parameters.TENSION_TOLERANCE THEN
//			IF NOT TensionStabilityTimer.IN THEN
//				TensionStabilityTimer.IN := TRUE;
//				TensionStabilityTimer.PT := Parameters.STABILITY_TIME; // 1 second
//			END_IF;
//		ELSE
//			TensionStabilityTimer.IN := FALSE;
//		END_IF;
//    
//		TensionStabilityTimer();
//    
//		// Complete when stable for required time
//		IF TensionStabilityTimer.Q THEN
//			TensionStabilityTimer.IN := FALSE;
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
//		END_IF;
//    
//	END_IF;
END_ACTION
