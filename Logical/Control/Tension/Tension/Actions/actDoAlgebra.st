
ACTION actDoAlgebra: 
	ActLeftDancerPosScal :=  brmfloor(((INT_TO_REAL(ActLeftDancerPos) - 4060.0) *(1000.0/135534.0)));
	ActRightDancerPosScal := brmfloor(((INT_TO_REAL(ActRightDancerPos) - 4060.0) *(1000.0/135534.0)));
	gTensionLogic.Status.LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Status.RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
END_ACTION
