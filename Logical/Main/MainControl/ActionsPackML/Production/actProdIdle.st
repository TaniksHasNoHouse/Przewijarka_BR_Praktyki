ACTION actProdIdle:
// Waiting for START button press
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_PRODUCTION) THEN
        
		gMainLogic.MotorMode.Production.Parameter.Velocity := gHMI.Recipe.CurrentRecipe.Speed;
		gMainLogic.MotorMode.Production.Parameter.DancerPos1 := gHMI.Recipe.CurrentRecipe.TensionLeft;
		gMainLogic.MotorMode.Production.Parameter.DancerPos2 := gHMI.Recipe.CurrentRecipe.TensionRight;
        
		IF gHMI.Main.MaterialAdj.Direction THEN
			gMainLogic.MotorMode.Production.Parameter.Distance := gHMI.Main.MaterialAdj.Length;
		ELSE
			gMainLogic.MotorMode.Production.Parameter.Distance := -gHMI.Main.MaterialAdj.Length;
		END_IF;
    
	END_IF;
END_ACTION