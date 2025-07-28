PROGRAM _INIT
	actInitTension;
END_PROGRAM

PROGRAM _CYCLIC
	actReadGlobals;
	actCatchError;
	actLineInGroupVelocity;
	CASE step OF
		INIT:
			actInitTencionGroup;
		HOME:	
			actHomeTensionGroup;
		POWER:
			actPowerOnTensionGroup;
		WAIT_FOR_COMMAND:
			actWaitForCommand;
		MOVE_ABSOLUTE:
			actExecuteMoveAbsolute;
		ERROR:
			actHandleError;
		ERROR_RESET:
			actExecuteErrorReset;
		TEST:
			
	END_CASE;
	actDoAlgebra;
	actCallBlocks;
	actSetGlogals;
END_PROGRAM

PROGRAM _EXIT
    actExitTension; 
END_PROGRAM

