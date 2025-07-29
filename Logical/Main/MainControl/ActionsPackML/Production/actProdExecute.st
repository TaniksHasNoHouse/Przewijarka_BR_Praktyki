
ACTION actProdExecute:
// Wind material 0.9m, then go to completing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_PRODUCTION) THEN
		gMainLogic.MotorMode.Production.Parameter.Distance := 100.0;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 500.0;
		
		// cala linia zeby ruszyc -> enable -> home -> power on -> start winding 
		gMainLogic.MotorMode.Production.Cmd.Home := TRUE;
		IF gTensionLogic.Status.LineIsHomed THEN 
			gMainLogic.MotorMode.Production.Cmd.PowerOn := TRUE;
			IF gTensionLogic.Status.LineIsPoweredOn THEN
				gMainLogic.MotorMode.Production.Cmd.StartWinding := TRUE;
				END_IF;	
		END_IF;
		IF gMainLogic.MotorMode.Production.Cmd.StartWinding THEN
			IF gMainLogic.MotorMode.Production.Status.ActDistance >= gMainLogic.MotorMode.Production.Parameter.Distance * 0.9 THEN
				gMainLogic.MotorMode.Production.Parameter.Velocity := gMainLogic.MotorMode.Production.Parameter.Velocity/2;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
			END_IF;
		END_IF;
		
	END_IF;
END_ACTION