
TYPE
	PureVAxisInterface : 	STRUCT 
		Outputs : VAxisOutputType;
		Imputs : VAxisImputType;
	END_STRUCT;
	VAxisOutputType : 	STRUCT 
		PowerOn : BOOL;
		ErrorReset : BOOL;
		BrakeControl : BOOL;
		SetSpeed : REAL;
		SetPosition : DINT;
	END_STRUCT;
	VAxisImputType : 	STRUCT 
		StatusImputs : StatusImpustsType;
		DigitalImputs : DigitalImputsType;
	END_STRUCT;
	StatusImpustsType : 	STRUCT 
		PowerOn : BOOL;
		CommunicationReady : BOOL;
		ReadyForPowerOn : BOOL;
		ErrorReactionActive : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		Warning : BOOL;
		WarnignID : DINT;
	END_STRUCT;
	DigitalImputsType : 	STRUCT 
		HomingSwitch : BOOL;
		PositiveLimitSwitch : BOOL;
		NegativeLimitSwitch : BOOL;
		Trigger1 : BOOL;
		Trigger2 : BOOL;
		Quickstop : BOOL;
	END_STRUCT;
END_TYPE
