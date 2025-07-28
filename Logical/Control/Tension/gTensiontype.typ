
TYPE
	gTensionLogicType : 	STRUCT 
		Mode : WorkModeType;
		Cmd : CommandTensionType;
		Parameter : ParameterTensionType;
		Status : StatusTensionType;
	END_STRUCT;
	CommandTensionType : 	STRUCT 
		SetRightDancerPos : REAL;
		SetLeftDancerPos : REAL;
	END_STRUCT;
	ParameterTensionType : 	STRUCT 
		GroupLineVelocity : REAL; (*in m/min*)
	END_STRUCT;
	StatusTensionType : 	STRUCT 
		ActRightDancerPos : INT;
		ActLeftDancerPos : INT;
		LeftWinderDiameter : REAL;
		RightWinderDiameter : REAL;
		LineIsInMove : BOOL;
		ProgressBarProcent : REAL;
	END_STRUCT;
	WorkModeType : 	STRUCT 
		Production : ProdLogicType;
		Manual : ManAxisSelectType;
	END_STRUCT;
	ProdLogicType : 	STRUCT 
		Cmd : ProdCmdType;
		Parameter : ProdParType;
		Status : ProdStatusType;
	END_STRUCT;
	ProdCmdType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	ProdParType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	ProdStatusType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	ManAxisSelectType : 	STRUCT 
		Axis1 : Axis1LogType;
		Axis2 : Axis2LogType;
		Axis3 : Axis3LogType;
	END_STRUCT;
	Axis1LogType : 	STRUCT 
		Cmd : Axis1CMDType;
		Parameter : Axis1ParaType;
		Status : Axis1StatType;
	END_STRUCT;
	Axis2LogType : 	STRUCT 
		Cmd : Axis2CMDType;
		Parameter : Axis2ParaType;
		Status : Axis2StatType;
	END_STRUCT;
	Axis3LogType : 	STRUCT 
		Cmd : Axis3CMDType;
		Parameter : Axis3ParaType;
		Status : Axis3StatType;
	END_STRUCT;
	Axis1CMDType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	Axis1ParaType : 	STRUCT 
		RotarySpeed : REAL;
		Axis1DancerPara : Axis1ParaDancerPID;
		Axis1PID : Axis1ParaPID;
	END_STRUCT;
	Axis1ParaDancerPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis1ParaPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis1StatType : 	STRUCT 
		IsInMotion : BOOL;
	END_STRUCT;
	Axis2CMDType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	Axis2ParaType : 	STRUCT 
		LinearSpeed : REAL;
		Axis2PID : Axis2ParaPID;
	END_STRUCT;
	Axis2ParaPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis2StatType : 	STRUCT 
		IsInMotion : BOOL;
	END_STRUCT;
	Axis3CMDType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	Axis3ParaType : 	STRUCT 
		RotarySpeed : REAL;
		Axis3DancerPara : Axis3ParaDancerPID;
		Axis3PID : Axis3ParaPID;
	END_STRUCT;
	Axis3ParaDancerPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis3ParaPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis3StatType : 	STRUCT 
		IsInMotion : BOOL;
	END_STRUCT;
END_TYPE
