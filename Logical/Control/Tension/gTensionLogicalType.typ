TYPE
	(*Enumeration for the tension control state machine, renamed for clarity from TESTstate*)
	TensionStateEnum :
		(
		TNS_INIT,
		TNS_POWER,
		TNS_ERROR,
		TNS_ERROR_RESET,
		TNS_HOME,
		TNS_WAIT_FOR_COMMAND,
		TNS_MOVE_ABSOLUTE
	);

	(*Structure to group the Process Variable (PV) name configurations*)
	TensionPV_ConfigType : STRUCT
		SetLeftDancerPos : STRING[255];
		ActLeftDancerPosScal : STRING[255];
		SetRightDancerPos : STRING[255];
		ActRightDancerPosScal : STRING[255];
	END_STRUCT;

	(*Structure for all configuration and parameters*)
	TensionParType : STRUCT
		ConfigType : ARRAY[0..2] OF MpTensionControllerConfigType;
		Config : ARRAY[0..2] OF MpTensionControllerConfig;
		AxisNames : ARRAY[0..2] OF STRING[32];
		PV_Names : TensionPV_ConfigType;
		SetLeftDancerPos : REAL;
		SetRightDancerPos : REAL;
		GroupLineVelocity : REAL;
	END_STRUCT;

	(*Structure for all status feedback and actual process values*)
	TensionStatusType : STRUCT
		RightWinderDiameter : REAL;
		LeftWinderDiameter : REAL;
		ActLeftDancerPos : INT;
		ActLeftDancerPosScal : REAL;
		ActRightDancerPos : INT;
		ActRightDancerPosScal : REAL;
	END_STRUCT;

	(*Structure for internal variables and function block instances*)
	TensionInternalType : STRUCT
		Controller : ARRAY[0..2] OF MpTensionController;
		Group : MpTensionGroup;
		MvAbsActive : BOOL;
		LoopIndex : USINT;
	END_STRUCT;

	(*Main global structure for the entire tension control program*)
	gTensionLogicType : STRUCT
		State : TensionStateEnum;
		Par : TensionParType;
		Status : TensionStatusType;
		Internal : TensionInternalType;
	END_STRUCT;

END_TYPE