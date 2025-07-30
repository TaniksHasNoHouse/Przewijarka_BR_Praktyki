
ACTION actReadGlobals: 
	TensionGroup.Enable := TRUE;
	TensionGroup.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
	TensionGroup.Home := gMainLogic.MotorMode.Production.Cmd.Home;
	TensionGroup.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
	TensionGroup.MoveVelocity := gMainLogic.MotorMode.Production.Cmd.StartWinding;
	
	MpAxisBasicFB[0].Enable := TRUE;
	MpAxisBasicFB[0].Home := gMainLogic.MotorMode.Manual.Axis1.Cmd.Home;
	MpAxisBasicFB[0].Power := gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn;
	MpAxisBasicFB[0].ErrorReset := gMainLogic.MotorMode.Manual.Axis1.Cmd.Reset;
	MpAxisBasicFB[0].AutoTune := gMainLogic.MotorMode.Manual.Axis1.Cmd.PIDauto;
	IF gMainLogic.MotorMode.Manual.Axis1.Parameter.Dir THEN
		MpAxisBasicFB[0].JogPositive := gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis;
	ELSIF NOT(gMainLogic.MotorMode.Manual.Axis1.Parameter.Dir) THEN
		MpAxisBasicFB[0].JogNegative := gMainLogic.MotorMode.Manual.Axis1.Cmd.JogAxis;
	END_IF;
	
	MpAxisBasicFB[1].Enable := TRUE;
	MpAxisBasicFB[1].Home := gMainLogic.MotorMode.Manual.Axis2.Cmd.Home;
	MpAxisBasicFB[1].Power := gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn;
	MpAxisBasicFB[1].ErrorReset := gMainLogic.MotorMode.Manual.Axis2.Cmd.Reset;
	MpAxisBasicFB[1].AutoTune := gMainLogic.MotorMode.Manual.Axis2.Cmd.PIDauto;
	IF gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir THEN
		MpAxisBasicFB[1].JogPositive := gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis;
	ELSIF NOT(gMainLogic.MotorMode.Manual.Axis2.Parameter.Dir) THEN
		MpAxisBasicFB[1].JogNegative := gMainLogic.MotorMode.Manual.Axis2.Cmd.JogAxis;
	END_IF;
	
	MpAxisBasicFB[2].Enable := TRUE;
	MpAxisBasicFB[2].Home := gMainLogic.MotorMode.Manual.Axis3.Cmd.Home;
	MpAxisBasicFB[2].Power := gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn;
	MpAxisBasicFB[2].ErrorReset := gMainLogic.MotorMode.Manual.Axis3.Cmd.Reset;
	MpAxisBasicFB[2].AutoTune := gMainLogic.MotorMode.Manual.Axis3.Cmd.PIDauto;
	IF gMainLogic.MotorMode.Manual.Axis3.Parameter.Dir THEN
		MpAxisBasicFB[2].JogPositive := gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis;
	ELSIF NOT(gMainLogic.MotorMode.Manual.Axis3.Parameter.Dir) THEN
		MpAxisBasicFB[2].JogNegative := gMainLogic.MotorMode.Manual.Axis3.Cmd.JogAxis;
	END_IF;
	
END_ACTION
