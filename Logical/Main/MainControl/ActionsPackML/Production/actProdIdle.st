ACTION actProdIdle:
// Waiting for next button press
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_ALL) AND MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
    
		MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		MainLogic.MotorMode.Production.Parameter.Tension := 0.0;
    
	END_IF;
END_ACTION