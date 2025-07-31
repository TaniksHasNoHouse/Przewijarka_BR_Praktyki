
ACTION actProdCompleting:
// Wait until reaches end and stop everything, go to complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_PRODUCTION) THEN
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
	END_IF;
END_ACTION