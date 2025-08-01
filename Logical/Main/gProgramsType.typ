
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
	Axis3ParType : 	STRUCT 
		CyclesToDo : INT;
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		Dir : BOOL; (*1- positive jog  0-negative jog*)
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis3CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL; (*Jog is done respectivly to axis direction from parameters from derived type*)
		TensionReg : BOOL;
	END_STRUCT;
	Axis2StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
	END_STRUCT;
	Axis2ParType : 	STRUCT 
		CyclesToDo : INT;
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		Dir : BOOL; (*1- positive jog  0-negative jog*)
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis2CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL; (*Jog is done respectivly to axis direction from parameters from derived type*)
		TensionReg : BOOL;
	END_STRUCT;
	Axis1StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
	END_STRUCT;
	Axis1ParType : 	STRUCT 
		CyclesToDo : INT;
		TensionSetpoint : REAL;
		SpeedRatio : REAL;
		TensionOffset : REAL;
		Dir : BOOL; (*1- positive jog  0-negative jog*)
		RegulatorValues : Regulator;
	END_STRUCT;
	Axis1CmdType : 	STRUCT 
		Enable : BOOL;
		PowerOn : BOOL;
		Home : BOOL;
		Reset : BOOL;
		PIDauto : BOOL;
		JogAxis : BOOL; (*Jog is done respectivly to axis direction from parameters from derived type*)
		TensionReg : BOOL;
	END_STRUCT;
	Axis3LogicType : 	STRUCT 
		Cmd : Axis3CmdType;
		Parameter : Axis3ParType;
		Status : Axis3StatusType;
	END_STRUCT;
	Axis3StatusType : 	STRUCT 
		ActPosition : LREAL;
		ActVelocity : REAL;
		ActualTension : REAL;
		Ready : BOOL;
	END_STRUCT;
	Axis2LogicType : 	STRUCT 
		Cmd : Axis2CmdType;
		Parameter : Axis2ParType;
		Status : Axis2StatusType;
	END_STRUCT;
	AxisSelectionType : 	STRUCT 
		Axis1 : Axis1LogicType;
		Axis2 : Axis2LogicType;
		Axis3 : Axis3LogicType;
		JogWithTenReg : BOOL;
	END_STRUCT;
	MotorProdLogicType : 	STRUCT 
		Cmd : MotorProdCmdType;
		Parameter : MotorProdParType;
		Status : MotorProdStatusType;
		HMI : HMIInterfaceType;
	END_STRUCT;
	ModesType : 	STRUCT 
		Production : MotorProdLogicType;
		Manual : AxisSelectionType;
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
		TensionStable : BOOL; (*checks if dancers try to stable*)
		TensionReady : BOOL; (*checks if dancers are ready to start line*)
		AlarmsActive : BOOL;
		EmergencyStopped : BOOL;
		ErrorCode : DINT;
	END_STRUCT;
	MotorProdParType : 	STRUCT 
		Velocity : REAL;
		DancerPos1 : REAL;
		DancerPos2 : REAL;
		Distance : REAL; (*mm of material to be processed. given as negative line will move in opposite dir*)
		TensionTolerance : REAL;
		StabilityTime : TIME;
		SettlingTime : TIME;
		ResetDelayTime : TIME;
		StopDelayTime : TIME;
		CompleteDelayTime : TIME;
		dirRight : BOOL;
		dirLeft : BOOL;
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
	MainLogicType : 	STRUCT 
		MotorMode : ModesType;
		Step : StepEnum;
		Mode : PackMLModes;
	END_STRUCT;
	PackMLModes : 
		(
		PACKML_MODE_PRODUCTION := 1,
		PACKML_MODE_MANUAL := 2
		);
	Axis1LogicType : 	STRUCT 
		Cmd : Axis1CmdType;
		Parameter : Axis1ParType;
		Status : Axis1StatusType;
	END_STRUCT;
	Regulator : 	STRUCT 
		P : REAL;
		I : REAL;
	END_STRUCT;
END_TYPE
