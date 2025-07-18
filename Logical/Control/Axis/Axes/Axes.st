
PROGRAM _INIT
	actInitAxes;
END_PROGRAM

PROGRAM _CYCLIC
	actPrepForWork;
	FOR i := 0 TO 2 DO
		IF Control.Step[i] = READY_FOR_USE THEN
			Control.Step[i] := WAIT_FOR_COMMAND;
			Control.WorkStep[i] := WAIT_FOR_WORK_COMMAND;
		END_IF;
		actBlocksInit;
	END_FOR;
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

