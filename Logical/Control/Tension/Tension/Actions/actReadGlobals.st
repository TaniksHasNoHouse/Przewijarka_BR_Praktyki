
ACTION actReadGlobals:
	TensionController[0].ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	TensionController[1].ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	TensionController[2].ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	TensionGroup.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	TensionGroup.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	IF TensionGroup.IsHomed THEN
	  	TensionGroup.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
	END_IF;
	IF TensionGroup.PowerOn THEN
	  TensionGroup.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
		TensionGroup.MoveVelocity := TensionGroup.PowerOn AND gTensionLogic.Status.MasterIsPowerOn;
	END_IF;
	
	MpAxisBasicFB[0].ErrorReset := gMainLogic.MotorMode.Manual.Axis1.Cmd.Reset;
	MpAxisBasicFB[0].Home := gMainLogic.MotorMode.Manual.Axis1.Cmd.Home;
	IF MpAxisBasicFB[0].IsHomed THEN
	  	MpAxisBasicFB[0].Power := gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn;
	END_IF;
	IF MpAxisBasicFB[1].PowerOn THEN
		MpAxisBasicFB[0].AutoTune := gMainLogic.MotorMode.Manual.Axis1.Cmd.PIDauto;
		IF gMainLogic.MotorMode.Manual.Axis1.Parameter.Dir THEN
			MpAxisBasicFB[0].JogPositive := gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis;
		ELSIF NOT(gMainLogic.MotorMode.Manual.Axis1.Parameter.Dir) THEN
			MpAxisBasicFB[0].JogNegative := gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis;
		END_IF;
	END_IF;
	
	MpAxisBasicFB[1].Home := gMainLogic.MotorMode.Manual.Axis2.Cmd.Home;
	IF MpAxisBasicFB[1].IsHomed THEN
		MpAxisBasicFB[1].Power := gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn;
	END_IF;
	IF MpAxisBasicFB[1].PowerOn THEN
		MpAxisBasicFB[1].Power := gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn;
		MpAxisBasicFB[1].ErrorReset := gMainLogic.MotorMode.Manual.Axis2.Cmd.Reset;
		MpAxisBasicFB[1].AutoTune := gMainLogic.MotorMode.Manual.Axis2.Cmd.PIDauto;
		IF gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir THEN
			MpAxisBasicFB[1].JogPositive := gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis;
		ELSIF NOT(gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir) THEN
			MpAxisBasicFB[1].JogNegative := gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis;
		END_IF;
	END_IF;
	

	MpAxisBasicFB[2].Home := gMainLogic.MotorMode.Manual.Axis3.Cmd.Home;
	IF MpAxisBasicFB[2].IsHomed THEN
		MpAxisBasicFB[2].Power := gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn;
	END_IF;
	IF MpAxisBasicFB[2].PowerOn THEN
		MpAxisBasicFB[2].Power := gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn;
		MpAxisBasicFB[2].ErrorReset := gMainLogic.MotorMode.Manual.Axis3.Cmd.Reset;
		MpAxisBasicFB[2].AutoTune := gMainLogic.MotorMode.Manual.Axis3.Cmd.PIDauto;
		IF gMainLogic.MotorMode.Manual.Axis3.Parameter.Dir THEN
			MpAxisBasicFB[2].JogPositive := gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis;
		ELSIF NOT(gMainLogic.MotorMode.Manual.Axis3.Parameter.Dir) THEN
			MpAxisBasicFB[2].JogNegative := gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis;
		END_IF;
	END_IF;
	IF gTensionLogic.Status.SetDancers THEN
	  	SetLeftDancerPos := gMainLogic.MotorMode.Production.Parameter.DancerPos1;
		SetRightDancerPos := gMainLogic.MotorMode.Production.Parameter.DancerPos2;
		gTensionLogic.Status.SetDancers := FALSE;
	END_IF;
	
END_ACTION
