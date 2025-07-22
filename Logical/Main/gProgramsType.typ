
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
		Reset : BOOL;
		Move : BOOL;
	END_STRUCT;
	MotorProdParType : 	STRUCT 
		Velocity : REAL;
		Tension : REAL;
		dirRight : BOOL;
		dirLeft : BOOL;
	END_STRUCT;
	MotorProdStatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActDir : STRING[10];
	END_STRUCT;
	PackMLModes : 
		(
		PACKML_MODE_PRODUCTION := 1,
		PACKML_MODE_MAINTENANCE := 2
	);
	ModesType : STRUCT 
		Production : MotorProdLogicType;
		Maintenance : AxisSelectionType;
	END_STRUCT;
	MotorProdLogicType : STRUCT 
		Cmd : MotorProdCmdType;
		Parameter : MotorProdParType;
		Status : MotorProdStatusType;
	END_STRUCT;
	AxisSelectionType : STRUCT 
		Axis1 : Axis1LogicType;
		Axis2 : Axis2LogicType;
		Axis3 : Axis3LogicType;
		JogWithTenReg : BOOL;
	END_STRUCT;
	Axis1LogicType : STRUCT 
		Cmd : Axis1CmdType;
		Parameter : Axis1ParType;
		Status : Axis1StatusType;
	END_STRUCT;
	Axis2LogicType : STRUCT 
		Cmd : Axis2CmdType;
		Parameter : Axis2ParType;
		Status : Axis2StatusType;
	END_STRUCT;
	Axis3LogicType : STRUCT 
		Cmd : Axis3CmdType;
		Parameter : Axis3ParType;
		Status : Axis3StatusType;
	END_STRUCT;
	Axis1CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL;
		TensionReg : BOOL;
	END_STRUCT;
	Axis1ParType : 	STRUCT 
		CyclesToDo : INT;
	END_STRUCT;
	Axis1StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
	END_STRUCT;
	Axis2CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL;
		TensionReg : BOOL;	
	END_STRUCT;
	Axis2ParType : 	STRUCT 
		CyclesToDo : INT;
	END_STRUCT;
	Axis2StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
	END_STRUCT;
	Axis3CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL;
		TensionReg : BOOL;
	END_STRUCT;
	Axis3ParType : 	STRUCT 
		CyclesToDo : INT;
	END_STRUCT;
	Axis3StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
	END_STRUCT;
END_TYPE
