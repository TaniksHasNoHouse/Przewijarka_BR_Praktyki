
ACTION actSetGlogals:
	gTensionLogic.Status.ActLeftDancerPos := ActLeftDancerPosScal;
	gTensionLogic.Status.ActRightDancerPos := ActRightDancerPosScal;
	gTensionLogic.Status.LeftWinderDiameter := TensionController[0].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Status.RightWinderDiameter := TensionController[2].Info.DiameterEstimation.EstimatedDiameter;
	gTensionLogic.Mode.Manual.Axis1.Parameter.RotarySpeed := MpAxisBasicFB[0].Velocity * 60.0 / 360.0;
	gTensionLogic.Mode.Manual.Axis2.Parameter.LinearSpeed := MpAxisBasicFB[1].Velocity * 60.0 / 1000.0;
	gTensionLogic.Mode.Manual.Axis3.Parameter.RotarySpeed := MpAxisBasicFB[2].Velocity * 60.0 / 360.0;
	gTensionLogic.Mode.Manual.Axis1.Status.IsInMotion := MpAxisBasicFB[0].MoveActive;
	gTensionLogic.Mode.Manual.Axis2.Status.IsInMotion := MpAxisBasicFB[1].MoveActive;
	gTensionLogic.Mode.Manual.Axis3.Status.IsInMotion := MpAxisBasicFB[2].MoveActive;
	gTensionLogic.Status.LineIsHomed := TensionGroup.IsHomed AND gTensionLogic.Status.MasterIsHomed;
	gTensionLogic.Status.LineIsPoweredOn := TensionGroup.PowerOn AND gTensionLogic.Status.MasterIsPowerOn;
	gMainLogic.MotorMode.Production.Status.ActDistance := TensionController[1].Info.ProcessedMaterial;
	gTensionLogic.Status.EnableAxis1 := MpAxisBasicFB[0].Info.DigitalInputsStatus.DriveEnable;
	gTensionLogic.Status.EnableAxis2 := MpAxisBasicFB[1].Info.DigitalInputsStatus.DriveEnable;
	gTensionLogic.Status.EnableAxis3 := MpAxisBasicFB[2].Info.DigitalInputsStatus.DriveEnable;
	gTensionLogic.Status.ProgressBarProcent := ProgressBarProcent;
	gTensionLogic.Status.ErrorExist := TensionController[0].Error OR TensionController[1].Error OR TensionController[2].Error OR TensionGroup.Error;
	gTensionLogic.Status.ActProcessedDistance := StartingMaterialToProcess;
END_ACTION
