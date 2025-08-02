
ACTION actProdExecute:
// Wind material 0.9m, then go to completing
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_EXECUTE, PACKML_MODE_PRODUCTION) THEN

		gMainLogic.MotorMode.Production.Cmd.StartWinding := TRUE;
		IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		END_IF;
		IF gMainLogic.MotorMode.Production.Cmd.StartWinding THEN
			IF gTensionLogic.Status.MoveDone THEN
				gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
				MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
			END_IF;
		END_IF;
		
	END_IF;
END_ACTION