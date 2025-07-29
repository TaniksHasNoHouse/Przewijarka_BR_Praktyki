
PROGRAM _INIT
	actInitTensionConfig;
END_PROGRAM

PROGRAM _CYCLIC
	actCallTensionConfig;
	
//	TensionConfig[0].Load := TRUE;
//	TensionConfig[1].Load := TRUE;
//	TensionConfig[2].Load := TRUE;
	actConfigAxis1;
	actConfigAxis3;

//	TensionConfig[0].Save := TRUE;
//	TensionConfig[1].Save := TRUE;
//	TensionConfig[2].Save := TRUE;

END_PROGRAM

PROGRAM _EXIT

	actExitTensionConfig;
	
END_PROGRAM

