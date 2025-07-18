
TYPE
	Control : 	STRUCT 
		Step : ARRAY[0..2]OF InitState;
	END_STRUCT;
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
	AxisParType : 	STRUCT 
		Deafult : MpAxisBasicParType;
	END_STRUCT;
	Axis : 	STRUCT 
		AxisBasic : MpAxisBasic;
		AxisPar : AxisParType;
	END_STRUCT;
END_TYPE
