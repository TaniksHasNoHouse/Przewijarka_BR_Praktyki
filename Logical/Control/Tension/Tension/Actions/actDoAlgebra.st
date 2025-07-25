
ACTION actDoAlgebra: 
	gTensionLogic.Status.ActLeftDancerPos :=  REAL_TO_INT((INT_TO_REAL(gTensionLogic.Status.ActLeftDancerPos) - 4060.0) *(1000.0/135534.0));
	gTensionLogic.Status.ActRightDancerPos := REAL_TO_INT((INT_TO_REAL(gTensionLogic.Status.ActRightDancerPos) - 4060.0) *(1000.0/135534.0));
	gTensionLogic.Status.LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Status.RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
END_ACTION
