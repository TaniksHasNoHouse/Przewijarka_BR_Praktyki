
TYPE
	gTensionLogicType : 	STRUCT 
		Mode : WorkModeType;
		Cmd : CommandTensionType;
		Parameter : ParameterTensionType;
		Status : StatusTensionType;
	END_STRUCT;
	CommandTensionType : 	STRUCT 
		SetRightDancerPos : REAL; (*sets position of right dancer in mm*)
		SetLeftDancerPos : REAL; (*sets position of left dancer in mm*)
	END_STRUCT;
	ParameterTensionType : 	STRUCT 
		GroupLineVelocity : REAL; (*in m/min*)
	END_STRUCT;
	StatusTensionType : 	STRUCT 
		ActRightDancerPos : REAL; (*actual right dancer position in mm*)
		ActLeftDancerPos : REAL; (*actual left dancer position in mmm*)
		LeftWinderDiameter : REAL; (*diameter on left winder*)
		RightWinderDiameter : REAL; (*diameter on right winder*)
		LineIsInMove : BOOL; (*checks if line is moving*)
		LineIsHomed : BOOL; (*checks if line is homed*)
		LineIsPoweredOn : BOOL; (*checks if line is powered on*)
		MasterIsPowerOn : BOOL; (*inside variable to communicate beatween programs*)
		MasterIsHomed : BOOL; (*inside variable to communicate beatween programs*)
		EnableAxis1 : BOOL; (*chacks if left axis is enabled*)
		EnableAxis2 : BOOL; (*chacks if middle axis is enabled*)
		EnableAxis3 : BOOL; (*chacks if right axis is enabled*)
		ProgressBarProcent : REAL; (*procent for progress bar*)
		ErrorExist : BOOL;
		SetDancers : BOOL; (*force dancers to set position on riseing edge*)
	END_STRUCT;
	WorkModeType : 	STRUCT 
		Production : ProdLogicType;
		Manual : ManAxisSelectType;
	END_STRUCT;
	ProdLogicType : 	STRUCT 
		a : BOOL;
	END_STRUCT;
	ManAxisSelectType : 	STRUCT 
		Axis1 : Axis1LogType;
		Axis2 : Axis2LogType;
		Axis3 : Axis3LogType;
	END_STRUCT;
	Axis1LogType : 	STRUCT 
		Parameter : Axis1ParaType;
		Status : Axis1StatType;
	END_STRUCT;
	Axis2LogType : 	STRUCT 
		Parameter : Axis2ParaType;
		Status : Axis2StatType;
	END_STRUCT;
	Axis3LogType : 	STRUCT 
		Parameter : Axis3ParaType;
		Status : Axis3StatType;
	END_STRUCT;
	Axis1ParaType : 	STRUCT 
		RotarySpeed : REAL; (*rpm*)
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
		IsInMotion : BOOL; (*checks if axis is in motion*)
	END_STRUCT;
	Axis2ParaType : 	STRUCT 
		LinearSpeed : REAL; (*m/min*)
		Axis2PID : Axis2ParaPID;
	END_STRUCT;
	Axis2ParaPID : 	STRUCT 
		P : REAL;
		I : REAL;
		D : REAL;
	END_STRUCT;
	Axis2StatType : 	STRUCT 
		IsInMotion : BOOL; (*checks if axis is in motion*)
	END_STRUCT;
	Axis3ParaType : 	STRUCT 
		RotarySpeed : REAL; (*in rpm*)
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
		IsInMotion : BOOL; (*checks if axis is in motion*)
	END_STRUCT;
END_TYPE
