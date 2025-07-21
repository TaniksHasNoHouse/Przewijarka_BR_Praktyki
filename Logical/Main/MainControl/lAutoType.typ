
TYPE
	StoppedEnum : 
		(
		STEP_STOPPED, (*STATE_STOPPED*)
		STEP_RESETTING (*STATE_RESETTING*)
	);
	MainType : 	STRUCT 
		PackMLStep : MainCmdType;
	END_STRUCT;
	MainCmdType : 	STRUCT 
		Stopped : StoppedEnum;
	END_STRUCT;
END_TYPE
