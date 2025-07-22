ACTION actProdCompleting:
//// Wait until reaches end and stop everything, go to complete
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_ALL) THEN
//    
//		// Stop all movement
//		Control.Cmd.Velocity := 0.0;
//		Control.Cmd.StartWinding := FALSE;
//		Control.Cmd.Enable := FALSE;
//    
//		// Wait for complete stop
//		IF Control.Status.Stopped AND NOT Control.Status.Moving THEN
//			IF NOT CompletingTimer.IN THEN
//				CompletingTimer.IN := TRUE;
//				CompletingTimer.PT := Parameters.STOP_DELAY_TIME;
//			END_IF;
//		END_IF;
//    
//		CompletingTimer();
//    
//		// Complete when fully stopped
//		IF CompletingTimer.Q THEN
//			CompletingTimer.IN := FALSE;
//			Control.Cmd.ResetDistance := TRUE; // Reset for next cycle
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
//		END_IF;
//    
//		IF Control.Cmd.ResetDistance THEN
//			Control.Cmd.ResetDistance := FALSE;
//		END_IF;
//    
//	END_IF;
END_ACTION