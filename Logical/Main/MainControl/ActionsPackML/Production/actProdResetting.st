ACTION actProdResetting: 
// Auto mode: start regulator (power axes) and turn off outputs
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_PRODUCTION) THEN
		
		gMainLogic.MotorMode.Production.Cmd.Reset := TRUE;
		gMainLogic.MotorMode.Production.Cmd.Home := TRUE;
		gMainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
    
		IF gTensionLogic.Status.LineIsHomed AND gTensionLogic.Status.LineIsPoweredOn THEN
			gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
			gMainLogic.MotorMode.Production.Cmd.Home := FALSE;
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
    
	END_IF;
END_ACTION