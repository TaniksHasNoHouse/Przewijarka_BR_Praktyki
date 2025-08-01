(*Main type*)

TYPE
	HMI_type : 	STRUCT 
		Recipe : Recipe_type;
		Manual : Manual_type;
		ControlBtn : ControlBtn_type;
		Charts : Charts_type;
		ModuleOK : ModuleOK_type;
		Main : MainPage_type;
		Alarms : Alarms_type;
		Data : Data_type;
	END_STRUCT;
END_TYPE

(*Main page*)

TYPE
	RollAdj_type : 	STRUCT 
		Left : BOOL;
		Right : BOOL;
		LeftNum : REAL;
		RightNum : REAL;
	END_STRUCT;
	MainPage_type : 	STRUCT 
		RollAdj : RollAdj_type;
		MaterialAdj : MaterialAdj_type;
	END_STRUCT;
	MaterialAdj_type : 	STRUCT 
		Length : REAL;
		Direction : BOOL;
	END_STRUCT;
END_TYPE

(*Start, stop, reset, auto/manual buttons*)

TYPE
	ControlBtn_type : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		Reset : BOOL;
		AutoManual : BOOL;
	END_STRUCT;
END_TYPE

(*Recipe*)

TYPE
	DencerPI_type : 	STRUCT 
		P : REAL;
		I : REAL;
	END_STRUCT;
	Recipe_type : 	STRUCT 
		CurrentRecipe : CurrentRecipe_type;
		EnableEditing : BOOL;
		Load : BOOL;
	END_STRUCT;
	CurrentRecipe_type : 	STRUCT 
		TensionLeft : REAL := 50.0; (* Naci�g lewy, zakres 0�14 cm *)
		TensionRight : REAL := 50.0; (* Naci�g prawy, zakres 0�14 cm *)
		Speed : REAL := 0.0; (* Pr�dko�� ta�my w m/s *)
		RollLeft : MaxMinRollSize_type;
		RollRight : MaxMinRollSize_type;
		DataRegistration : BOOL := FALSE; (* Rejestracja danych: FALSE = wy�., TRUE = w�. *)
		Dencer1PID : DencerPI_type;
		Dencer2PID : DencerPI_type;
	END_STRUCT;
	MaxMinRollSize_type : 	STRUCT 
		MaxSize : REAL := 0.0;
		MinSize : REAL := 0.0;
	END_STRUCT;
END_TYPE

(*Manual page*)

TYPE
	Manual_type : 	STRUCT 
		JogLeftRight : JogLeftRight_type;
		JogMotors : JogMotors_type;
	END_STRUCT;
	JogLeftRight_type : 	STRUCT 
		Activate : BOOL;
		JogLeft : BOOL;
		JogRight : BOOL;
		SetBeltSpeed : REAL;
		JogLeftTemp : BOOL;
		JogRightTemp : BOOL;
		DenserLeft : REAL;
		DenserRight : REAL;
	END_STRUCT;
	JogMotors_type : 	STRUCT 
		Motor1 : manMotor_type;
		Motor2 : manMotor_type;
		Motor3 : manMotor_type;
	END_STRUCT;
	manMotor_type : 	STRUCT 
		Activate : BOOL;
		Home : BOOL;
		Speed : REAL;
		Left : BOOL;
		Right : BOOL;
	END_STRUCT;
END_TYPE

(*Charts*)

TYPE
	Record_type : 	STRUCT 
		Dancer1 : BOOL;
		Dancer2 : BOOL;
		Axis1 : BOOL;
		Axis2 : BOOL;
		Axis3 : BOOL;
	END_STRUCT;
	Data_type : 	STRUCT 
		isSaving : STRING[80];
	END_STRUCT;
	Charts_type : 	STRUCT 
		Dancer1 : REAL;
		Dancer2 : REAL;
		Vtape : REAL;
		Axis1 : REAL;
		Axis2 : REAL;
		Axis3 : REAL;
		Record : Record_type;
	END_STRUCT;
END_TYPE

(*ModuleOk*)

TYPE
	ModuleOK_type : 	STRUCT 
		PowerSupply : BOOL;
		AnalogInput : BOOL;
		SystemBusTransmitter : BOOL;
		ControlKeypad : BOOL;
	END_STRUCT;
END_TYPE

(*Alarms*)

TYPE
	Alarms_type : 	STRUCT 
		PendingAlarms : BOOL;
	END_STRUCT;
END_TYPE
