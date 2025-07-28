
ACTION SetGlogals:
	gTensionLogic.Status.ActLeftDancerPos := ActLeftDancerPosScal;
	gTensionLogic.Status.ActRightDancerPos := ActRightDancerPosScal;
	gTensionLogic.Status.LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Status.RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Mode.Manual.Axis1.Parameter.RotarySpeed := MpAxisBasicFB[0].Velocity;
	gTensionLogic.Mode.Manual.Axis2.Parameter.LinearSpeed := MpAxisBasicFB[1].Velocity;
	gTensionLogic.Mode.Manual.Axis3.Parameter.RotarySpeed := MpAxisBasicFB[2].Velocity;
END_ACTION
