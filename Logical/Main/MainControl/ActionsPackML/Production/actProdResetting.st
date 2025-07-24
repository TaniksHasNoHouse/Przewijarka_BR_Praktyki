ACTION actProdResetting: 
// Auto mode: start regulator (power axes) and turn off outputs
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_PRODUCTION) THEN
    
		gMainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
		gMainLogic.MotorMode.Production.Cmd.Enable := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		gMainLogic.MotorMode.Production.Parameter.Tension := 0.0;
		gMainLogic.MotorMode.Production.Cmd.TensionEnable := FALSE;
		gMainLogic.MotorMode.Production.Status.TensionStable := FALSE;
    
		IF gMainLogic.MotorMode.Production.Status.PowerReady AND gMainLogic.MotorMode.Production.Status.TensionReady THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION