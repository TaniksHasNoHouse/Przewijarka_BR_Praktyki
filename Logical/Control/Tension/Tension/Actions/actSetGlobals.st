
ACTION actSetGlogals:
	gTensionLogic.Status.ActLeftDancerPos := ActLeftDancerPosScal;
	gTensionLogic.Status.ActRightDancerPos := ActRightDancerPosScal;
	gTensionLogic.Status.LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Status.RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Mode.Manual.Axis1.Parameter.RotarySpeed := MpAxisBasicFB[0].Velocity;
	gTensionLogic.Mode.Manual.Axis2.Parameter.LinearSpeed := MpAxisBasicFB[1].Velocity;
	gTensionLogic.Mode.Manual.Axis3.Parameter.RotarySpeed := MpAxisBasicFB[2].Velocity;
	gTensionLogic.Mode.Manual.Axis1.Status.IsInMotion := MpAxisBasicFB[0].MoveActive;
	gTensionLogic.Mode.Manual.Axis2.Status.IsInMotion := MpAxisBasicFB[1].MoveActive;
	gTensionLogic.Mode.Manual.Axis3.Status.IsInMotion := MpAxisBasicFB[2].MoveActive;
	
	
END_ACTION
