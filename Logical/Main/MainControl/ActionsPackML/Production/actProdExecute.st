
ACTION actProdExecute:
// Wind material 0.9m, then go to completing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_PRODUCTION) THEN

		gMainLogic.MotorMode.Production.Cmd.StartWinding := TRUE;

		IF gMainLogic.MotorMode.Production.Cmd.StartWinding THEN
			IF gTensionLogic.Status.ActProcessedDistance >= gMainLogic.MotorMode.Production.Parameter.Distance * 0.9 THEN
				gMainLogic.MotorMode.Production.Parameter.Velocity := gMainLogic.MotorMode.Production.Parameter.Velocity/2;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
			END_IF;
		END_IF;
		
	END_IF;
END_ACTION