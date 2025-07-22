
TYPE
	StepEnum : 
		(
		STEP_STOPPED, (*STATE_STOPPED*)
		STEP_RESETTING, (*STATE_RESETTING*)
		STEP_IDLE, (*STATE_IDLE*)
		STEP_STARTING, (*STATE_STARTING*)
		STEP_EXECUTE, (*STATE_EXECUTE*)
		STEP_COMPLETING, (*STATE_COMPLETING*)
		STEP_COMPLETE, (*STATE_COMPLETE*)
		STEP_STOPPING, (*STATE_STOPPING*)
		STEP_ABORTING, (*STATE_ABORTING*)
		STEP_ABORTED, (*STATE_ABORTED*)
		STEP_CLEARING (*STATE_CLEARING*)
	);
	MainLogicType : 	STRUCT 
		Cmd : CmdType;
		MotorMode : ModesType;
		Parameter : MotorParType;
		Status : MotorStatusType;
		Step : StepEnum;
		Mode : PackMLModes;
	END_STRUCT;
	CmdType : 	STRUCT 
		Reset : BOOL;
		Start : BOOL;
		Stop : BOOL;
		Abort : BOOL;
	END_STRUCT;
	MotorProdCmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Yes : BOOL;
	END_STRUCT;
	MotorManCmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Yes : BOOL;
	END_STRUCT;
	MotorParType : 	STRUCT 
		CyclesToDo : INT;
	END_STRUCT;
	MotorStatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
	END_STRUCT;
	PackMLModes : 
		(
		PACKML_MODE_PRODUCTION := 1,
		PACKML_MODE_MAINTENANCE := 2
	);
	ModesType : STRUCT 
		Production : MotorProdCmdType;
		Maintenance : MotorManCmdType;
	END_STRUCT;
END_TYPE
