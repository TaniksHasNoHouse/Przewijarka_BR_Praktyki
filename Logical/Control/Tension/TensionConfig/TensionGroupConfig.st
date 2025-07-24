
PROGRAM _INIT
	actConfigAxis1;
	actConfigAxis2;
	actConfigAxis3;
	actInitTensionConfig;

END_PROGRAM

PROGRAM _CYCLIC
	
	actCallTensionConfig;
	
END_PROGRAM

PROGRAM _EXIT

	actExitTensionConfig;
	
END_PROGRAM

