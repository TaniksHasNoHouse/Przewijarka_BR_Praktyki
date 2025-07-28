
PROGRAM _INIT
	actConfigAxis1;
	actConfigAxis2;
	actConfigAxis3;
	actInitTensionConfig;

END_PROGRAM

PROGRAM _CYCLIC
	actCallTensionConfig;
	//TensionConfig[0].Enable := gMainLogic.MotorMode.Production.Cmd.TensionEnable;
	TensionConfig[0].Save := TRUE;
	TensionConfig[0].Load := TRUE;

END_PROGRAM

PROGRAM _EXIT

	actExitTensionConfig;
	
END_PROGRAM

