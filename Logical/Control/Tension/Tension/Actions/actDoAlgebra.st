
ACTION actDoAlgebra: 
	ActLeftDancerPosScal :=  brmfloor(((INT_TO_REAL(ActLeftDancerPos) - 4050.0) *(1000.0/135534.0)));
	ActRightDancerPosScal := brmfloor(((INT_TO_REAL(ActRightDancerPos) - 4066.0) *(1000.0/135534.0)));
	ProgressBarProcent :=  (TensionController[1].Info.ProcessedMaterial - StartigMaterialToProcess) * 1000.0 / gMainLogic.MotorMode.Production.Parameter.Distance;
	IF ProgressBarProcent := 100.0 THEN
	  StartigMaterialToProcess := TensionController[1].Info.ProcessedMaterial;
	END_IF;
END_ACTION
