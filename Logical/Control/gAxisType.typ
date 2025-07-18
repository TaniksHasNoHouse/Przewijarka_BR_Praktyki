
TYPE
	ControlType : 	STRUCT 
		Step : ARRAY[0..2]OF InitState;
		WorkStep : ARRAY[0..2]OF WorkState;
	END_STRUCT;
	WorkState : 
		(
		TEST_COMMAND,
		WAIT_FOR_WORK_COMMAND
		);
	InitState : 
		(
		COMMUNICATION,
		POWER,
		HOME,
		ERROR,
		READY_FOR_USE,
		ERROR_RESET,
		WAIT_FOR_COMMAND
		);
END_TYPE
