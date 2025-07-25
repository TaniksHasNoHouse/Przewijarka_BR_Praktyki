
TYPE
	ButtonStyles_type : 	STRUCT 
		Start : STRING[80];
		Stop : STRING[80];
		Reset : STRING[80];
	END_STRUCT;
	ButtonStates_type : 
		(
		STATE_WORKING,
		STATE_STOPPED,
		STATE_RESETING,
		STATE_IDLE
		);
END_TYPE
