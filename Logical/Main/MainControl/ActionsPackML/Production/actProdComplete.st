ACTION actProdComplete: 
//// Clear variables
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_ALL) THEN
//
//		// Clear production variables
//		Control.Cmd.Distance := 0.0;
//		Control.Cmd.Velocity := 0.0;
//		Control.Cmd.StartWinding := FALSE;
//		Control.Cmd.SetTension := 0.0;
//		Control.Cmd.TensionEnable := FALSE;
//    
//		// Clear temporary flags
//		Control.Cmd.ResetDistance := FALSE;
//		Control.Cmd.FreeBraking := FALSE;
//		Control.Cmd.AcknowledgeAll := FALSE;
//    
//		// Keep system powered and ready for next cycle
//		Control.Cmd.PowerEnable := TRUE;
//		Control.Cmd.ServoEnable := TRUE;
//		Control.Cmd.AutoMode := TRUE;
//		Control.Cmd.Enable := FALSE;
//    
//		// Optional: Add delay for variable clearing
//		IF NOT CompleteTimer.IN THEN
//			CompleteTimer.IN := TRUE;
//			CompleteTimer.PT := Parameters.COMPLETE_DELAY_TIME;
//		END_IF;
//    
//		CompleteTimer();
//    
//		// Complete the state and return to IDLE
//		IF CompleteTimer.Q THEN
//			CompleteTimer.IN := FALSE;
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
//		END_IF;
//    
//	END_IF;
END_ACTION