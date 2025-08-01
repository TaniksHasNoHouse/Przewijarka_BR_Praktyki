
ACTION actProdCompleting:
// Wait until reaches end and stop everything, go to complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_PRODUCTION) THEN
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;
		IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		END_IF;
		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION); 
	END_IF;
END_ACTION