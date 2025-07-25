
ACTION actDoAlgebra: 
	gTensionLogic.DancerPos.Status.ActLeftPos :=  REAL_TO_INT((INT_TO_REAL(gTensionLogic.DancerPos.Status.ActLeftPos) - 4060.0) *(1000.0/135534.0));
	gTensionLogic.DancerPos.Status.ActRightPos := REAL_TO_INT((INT_TO_REAL(gTensionLogic.DancerPos.Status.ActRightPos) - 4060.0) *(1000.0/135534.0));
	LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
END_ACTION
