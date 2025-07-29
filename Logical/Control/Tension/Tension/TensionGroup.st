PROGRAM _INIT
	actInitTension;
END_PROGRAM

PROGRAM _CYCLIC
	actReadGlobals;
	actLineInGroupVelocity;
	actDoAlgebra;
	actCallBlocks;
	actSetGlogals;
END_PROGRAM

PROGRAM _EXIT
    actExitTension; 
END_PROGRAM

