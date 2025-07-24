
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
	PackMLModes : 
		(
		PACKML_MODE_PRODUCTION := 1,
		PACKML_MODE_MANUAL := 2
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
		StartWinding : BOOL;
		TensionEnable : BOOL;
		ResetDistance : BOOL;
		FreeBraking : BOOL;
		EmergencyStop : BOOL;
		AcknowledgeAlarms : BOOL;
	END_STRUCT;
	MotorProdParType : 	STRUCT 
		Velocity : REAL;
		Tension : REAL;
		Distance : REAL;
		TensionTolerance : REAL;
		StabilityTime : TIME;
		SettlingTime : TIME;
		ResetDelayTime : TIME;
		StopDelayTime : TIME;
		CompleteDelayTime : TIME;
		dirRight : BOOL;
		dirLeft : BOOL;
	END_STRUCT;
	MotorProdStatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActDistance : REAL;
		ActDir : STRING[10];
		ActualTension : REAL;
		PowerReady : BOOL;
		SystemReady : BOOL;
		Moving : BOOL;
		Stopped : BOOL;
		TensionStable : BOOL;
		TensionReady : BOOL;
		AlarmsActive : BOOL;
		EmergencyStopped : BOOL;
		ErrorCode : DINT;
	END_STRUCT;
	HMIInterfaceType : 	STRUCT 
		RecipeNumber : INT;
		RecipeName : STRING[40];
		OperatorMessage : STRING[80];
		StatusMessage : STRING[40];
		GoodParts : DINT;
		BadParts : DINT;
		TotalParts : DINT;
	END_STRUCT;
	ModesType : 	STRUCT 
		Production : MotorProdLogicType;
		Manual : AxisSelectionType;
	END_STRUCT;
	MotorProdLogicType : 	STRUCT 
		Cmd : MotorProdCmdType;
		Parameter : MotorProdParType;
		Status : MotorProdStatusType;
		HMI : HMIInterfaceType;
	END_STRUCT;
	AxisSelectionType : 	STRUCT 
		Axis1 : Axis1LogicType;
		Axis2 : Axis2LogicType;
		Axis3 : Axis3LogicType;
		JogWithTenReg : BOOL;
	END_STRUCT;
	Axis1LogicType : 	STRUCT 
		Cmd : Axis1CmdType;
		Parameter : Axis1ParType;
		Status : Axis1StatusType;
	END_STRUCT;
	Axis2LogicType : 	STRUCT 
		Cmd : Axis2CmdType;
		Parameter : Axis2ParType;
		Status : Axis2StatusType;
	END_STRUCT;
	Axis3LogicType : 	STRUCT 
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
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis1StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
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
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis2StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
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
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis3StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
	END_STRUCT;
	Regulator : STRUCT
		P : REAL;
		I : REAL;
	END_STRUCT;
END_TYPE
