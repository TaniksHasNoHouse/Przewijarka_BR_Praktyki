TYPE
gTensionLogicType : STRUCT 
	Mode : WorkModeType;
	GroupLineVelocity : REAL;
END_STRUCT;
WorkModeType : STRUCT
	Production : ProdLogicType;
	Manual : ManAxisSelectType;
END_STRUCT;
ProdLogicType : STRUCT
	Cmd : ProdCmdType;
	Parameter: ProdParType;
	Status: ProdStatusType;
END_STRUCT;
ProdCmdType : STRUCT
END_STRUCT;
ProdParType : STRUCT
END_STRUCT;
ProdStatusType : STRUCT
END_STRUCT;
ManAxisSelectType : STRUCT
	Axis1: Axis1LogType;
	Axis2: Axis2LogType;
	Axis3: Axis3LogType;
END_STRUCT;
Axis1LogType : STRUCT
	Cmd : Axis1CMDType;
	Parameter: Axis1ParaType;
	Status: Axis1StatType;
END_STRUCT;
Axis2LogType : STRUCT
	Cmd : Axis2CMDType;
	Parameter: Axis2ParaType;
	Status: Axis2StatType;
END_STRUCT;
Axis3LogType : STRUCT
	Cmd : Axis3CMDType;
	Parameter: Axis3ParaType;
	Status: Axis3StatType;
END_STRUCT;
Axis1CMDType : STRUCT
END_STRUCT;
Axis1ParaType : STRUCT
END_STRUCT;
Axis1StatType : STRUCT
END_STRUCT;
Axis2CMDType : STRUCT
END_STRUCT;
Axis2ParaType : STRUCT
END_STRUCT;
Axis2StatType : STRUCT
END_STRUCT;
Axis3CMDType : STRUCT
END_STRUCT;
Axis3ParaType : STRUCT
END_STRUCT;
Axis3StatType : STRUCT
END_STRUCT;
END_TYPE