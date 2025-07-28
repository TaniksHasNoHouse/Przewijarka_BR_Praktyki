
TYPE
	ButtonStyles_type : 	STRUCT 
		Start : STRING[80];
		Stop : STRING[80];
		Reset : STRING[80];
		New_Member : USINT;
	END_STRUCT;
	ButtonStates_type : 
		(
		STATE_WORKING,
		STATE_STOPPED,
		STATE_RESETING,
		STATE_IDLE,
		STATE_ESTOPPED
		);
	PhysicalBtn : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		Estop : BOOL;
		Reset : BOOL;
	END_STRUCT;
END_TYPE
