
ACTION actDoAlgebra: 
	ActLeftDancerPosScal :=  brmfloor(((INT_TO_REAL(ActLeftDancerPos) - 4060.0) *(1000.0/135534.0)));
	ActRightDancerPosScal := brmfloor(((INT_TO_REAL(ActRightDancerPos) - 4045.0) *(1000.0/135534.0)));
	gTensionLogic.Status.ActProcessedDistance := TensionController[1].Info.ProcessedMaterial - StartingMaterialToProcess;
	ProgressBarProcent :=  (gTensionLogic.Status.ActProcessedDistance / gMainLogic.MotorMode.Production.Parameter.Distance) * 100.0;
	IF gMainLogic.MotorMode.Production.Parameter.Distance = 0.0 THEN
	  ProgressBarProcent := 0.0;
	END_IF;
	IF ProgressBarProcent >= 100.0 THEN
	  StartingMaterialToProcess := TensionController[1].Info.ProcessedMaterial;
	END_IF;
	
	
END_ACTION
