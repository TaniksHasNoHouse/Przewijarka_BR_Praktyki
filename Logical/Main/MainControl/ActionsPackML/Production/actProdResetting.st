ACTION actProdResetting: 
// Auto mode: start regulator (power axes) and turn off outputs
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_ALL) AND MainLogic.Mode = PACKML_MODE_PRODUCTION THEN
    
		MainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
		MainLogic.MotorMode.Production.Cmd.Enable := TRUE;
		MainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		MainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		MainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		MainLogic.MotorMode.Production.Parameter.Tension := 0.0;
		MainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
    
		IF MainLogic.MotorMode.Production.Status.PowerReady AND MainLogic.MotorMode.Production.Status.ServoReady THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_0);
		END_IF;
    
	END_IF;
END_ACTION