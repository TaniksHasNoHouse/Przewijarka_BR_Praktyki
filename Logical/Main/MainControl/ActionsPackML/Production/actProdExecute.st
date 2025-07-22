ACTION actProdExecute:
// Wind material 0.9m, then go to completing
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_ALL) THEN
//    
//		// Start winding material
//		Control.Cmd.Enable := TRUE;
//		Control.Cmd.StartWinding := TRUE;
//		Control.Cmd.Distance := Parameters.WINDING_DISTANCE; // 0.9m
//		Control.Cmd.Velocity := Parameters.WINDING_VELOCITY;
//    
//		// Check if target distance reached
//		IF Control.Status.ActualDistance >= Control.Cmd.Distance THEN
//			Control.Cmd.StartWinding := FALSE;
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0); // Go to COMPLETING
//		END_IF;
//    
//	END_IF;
END_ACTION