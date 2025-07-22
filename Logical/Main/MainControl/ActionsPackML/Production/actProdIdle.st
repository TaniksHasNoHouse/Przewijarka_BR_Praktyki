ACTION actProdIdle:
// Waiting for next button press
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_ALL) THEN
//    
//		// Maintain system ready but no movement
//		Control.Cmd.Velocity := 0.0;
//		Control.Cmd.StartWinding := FALSE;
//		Control.Cmd.SetTension := 0.0;
//    
//		// Stay in idle - PackML will handle start command from HMI
//    
//	END_IF;
END_ACTION