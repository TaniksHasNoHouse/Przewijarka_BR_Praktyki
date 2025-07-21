
TYPE
	StoppedEnum : 
		(
		STOPPED_IDLE (*STOPPED_IDLE*)
		);
	MainType : 	STRUCT 
		PackMLStep : MainCmdType;
	END_STRUCT;
	MainCmdType : 	STRUCT 
		Stopped : StoppedEnum;
	END_STRUCT;
END_TYPE
