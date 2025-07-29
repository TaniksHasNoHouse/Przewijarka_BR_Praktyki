
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
	gTensionLogic.Status.EnableAxis1 := MpAxisBasicFB[0].Info.DigitalInputsStatus.DriveEnable;
	gTensionLogic.Status.EnableAxis2 := MpAxisBasicFB[1].Info.DigitalInputsStatus.DriveEnable;
	gTensionLogic.Status.EnableAxis3 := MpAxisBasicFB[2].Info.DigitalInputsStatus.DriveEnable;
	
END_ACTION
