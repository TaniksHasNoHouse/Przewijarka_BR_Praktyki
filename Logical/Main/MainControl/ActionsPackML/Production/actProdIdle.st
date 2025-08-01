ACTION actProdIdle:
// Waiting for START button press
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_PRODUCTION) THEN
        
		gMainLogic.MotorMode.Production.Cmd.Reset := FALSE;
		gMainLogic.MotorMode.Production.Parameter.Velocity := gHMI.Recipe.CurrentRecipe.Speed;
		gMainLogic.MotorMode.Production.Parameter.DancerPos1 := gHMI.Recipe.CurrentRecipe.TensionLeft;
		gMainLogic.MotorMode.Production.Parameter.DancerPos2 := gHMI.Recipe.CurrentRecipe.TensionRight;
        
		IF gHMI.Main.MaterialAdj.Direction THEN
			gMainLogic.MotorMode.Production.Parameter.Distance := gHMI.Main.MaterialAdj.Length;
		ELSE
			gMainLogic.MotorMode.Production.Parameter.Distance := -gHMI.Main.MaterialAdj.Length;
		END_IF;
		IF NOT gTensionLogic.Status.EnableAxis1 OR NOT gTensionLogic.Status.EnableAxis2 OR NOT gTensionLogic.Status.EnableAxis3 THEN
			MpPackMLBasicUIConnect.StateControl.Abort := TRUE;
		END_IF;
		IF NOT gTensionLogic.Status.ErrorExist THEN
	  		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_PRODUCTION);
		END_IF;
	END_IF;
END_ACTION