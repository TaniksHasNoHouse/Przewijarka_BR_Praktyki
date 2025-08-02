ACTION actProdComplete: 
// Clear variables
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETE, PACKML_MODE_PRODUCTION) THEN
		
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		END_IF;
	END_IF;
END_ACTION