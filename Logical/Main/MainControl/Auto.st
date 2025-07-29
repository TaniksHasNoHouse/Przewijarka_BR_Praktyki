
PROGRAM _INIT
	(* Insert code here *)
	 xd := TRUE;
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	// do wyjebania tension enable
	actStopped;
	actStopping;
	actAborting;
	actAborted;
	actClearing;
	actProdResetting;
	actProdIdle;
	actProdStarting;
	actProdExecute;
	actProdCompleting;
	actProdComplete;
	actManResetting;
	actManIdle;
	
	
//	TensionGroup.Enable := gMainLogic.MotorMode.Production.Cmd.Enable;
//	TensionGroup.Power := gMainLogic.MotorMode.Production.Cmd.PowerOn;
//	TensionGroup.Home := gMainLogic.MotorMode.Production.Cmd.Home;
//	TensionGroup.ErrorReset := gMainLogic.MotorMode.Production.Cmd.Reset;
//	IF TensionGroup.PowerOn THEN
//		TensionGroup.MoveVelocity := TRUE;
//	END_IF;
//	
//	MpAxisBasicFB[0].Enable := gMainLogic.MotorMode.Manual.Axis1.Cmd.Enable;
//	MpAxisBasicFB[0].Home := gMainLogic.MotorMode.Manual.Axis1.Cmd.Home;
//	MpAxisBasicFB[0].Power := gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn;
//	MpAxisBasicFB[0].ErrorReset := gMainLogic.MotorMode.Manual.Axis1.Cmd.Reset;
//	MpAxisBasicFB[0].AutoTune := gMainLogic.MotorMode.Manual.Axis1.Cmd.PIDauto;
//	
//	MpAxisBasicFB[1].Enable := gMainLogic.MotorMode.Manual.Axis2.Cmd.Enable;
//	MpAxisBasicFB[1].Home := gMainLogic.MotorMode.Manual.Axis2.Cmd.Home;
//	MpAxisBasicFB[1].Power := gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn;
//	MpAxisBasicFB[1].ErrorReset := gMainLogic.MotorMode.Manual.Axis2.Cmd.Reset;
//	MpAxisBasicFB[1].AutoTune := gMainLogic.MotorMode.Manual.Axis2.Cmd.PIDauto;
//	
//	MpAxisBasicFB[2].Enable := gMainLogic.MotorMode.Manual.Axis3.Cmd.Enable;
//	MpAxisBasicFB[2].Home := gMainLogic.MotorMode.Manual.Axis3.Cmd.Home;
//	MpAxisBasicFB[2].Power := gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn;
//	MpAxisBasicFB[2].ErrorReset := gMainLogic.MotorMode.Manual.Axis3.Cmd.Reset;
//	MpAxisBasicFB[2].AutoTune := gMainLogic.MotorMode.Manual.Axis3.Cmd.PIDauto;
//	
//	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

