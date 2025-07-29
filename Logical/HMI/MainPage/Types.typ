
TYPE
	ManualBtn_type : 	STRUCT 
		Left : Buttons_type;
		Right : Buttons_type;
	END_STRUCT;
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
		STATE_ESTOPPED,
		STATE_MANUAL
		);
	Buttons_type : 	STRUCT 
		State : BOOL;
		ColorON : BOOL;
		ColorOFF : BOOL;
	END_STRUCT;
	PhysicalBtn_type : 	STRUCT 
		Start : Buttons_type;
		Stop : ButtonStop_type;
		Reset : Buttons_type;
		Manual : ManualBtn_type;
	END_STRUCT;
	ButtonStop_type : 	STRUCT 
		State : BOOL;
		ColorON : BOOL;
		ColorOFF : BOOL;
		ColorEstop : BOOL;
	END_STRUCT;
END_TYPE
