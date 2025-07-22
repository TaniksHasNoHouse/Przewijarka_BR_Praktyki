ACTION actProdResetting: 
//// Auto mode: start regulator (power axes) and turn off outputs (so nothing moves)
//	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_ALL) THEN
//    
//		// Power up regulators/axes for auto mode
//		Control.Cmd.PowerEnable := TRUE;
//		Control.Cmd.ServoEnable := TRUE;
//		Control.Cmd.AutoMode := TRUE;
//		Control.Cmd.TensionEnable := FALSE;
//    
//		
// Turn off all movement outputs (ensure nothing moves)
//		Control.Parameters.Velocity := 0.0;
//		Control.Parameters.StartWinding := FALSE;
//		Control.Parameters.Distance := 0.0;
//		Control.Parameters.Tension := 0.0;
//		
//		
//    
//		// Wait for system ready
//		IF Control.Status.PowerReady AND Control.Status.ServoReady THEN
//			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
//		END_IF;
//    
//	END_IF;
END_ACTION