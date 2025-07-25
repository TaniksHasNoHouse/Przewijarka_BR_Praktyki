(*Main type*)

TYPE
	HMI_type : 	STRUCT 
		Recipe : Recipe_type;
		Main : Main_type;
		Manual : Manual_type;
		ControlBtn : ControlBtn_type;
		Charts : Charts_type;
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
	Recipe_type : 	STRUCT 
		CurrentRecipe : CurrentRecipe_type;
		EnableEditing : BOOL;
	END_STRUCT;
	CurrentRecipe_type : 	STRUCT 
		TensionLeft : USINT := 0; (* Naci¹g lewy, zakres 0–14 cm *)
		TensionRight : USINT := 0; (* Naci¹g prawy, zakres 0–14 cm *)
		Speed : USINT := 0; (* Prêdkoœæ taœmy w m/s *)
		Direction : BOOL := FALSE; (* Kierunek ruchu: FALSE = lewo, TRUE = prawo *)
		Motor1PID : MotorPID_type;
		Motor2PID : MotorPID_type;
		Motor3PID : MotorPID_type;
		RollLeft : MaxMinRollSize_type;
		RollRight : MaxMinRollSize_type;
		DataRegistration : BOOL := FALSE; (* Rejestracja danych: FALSE = wy³., TRUE = w³. *)
		MaterialLength : REAL;
	END_STRUCT;
	MotorPID_type : 	STRUCT 
		P : REAL := 0.0;
		I : REAL := 0.0;
	END_STRUCT;
	MaxMinRollSize_type : 	STRUCT 
		MaxSize : REAL := 0.0;
		MinSize : REAL := 0.0;
	END_STRUCT;
END_TYPE

(*Main page*)

TYPE
	Main_type : 	STRUCT 
		CurrDenserLeft : USINT;
		CurrDenserRight : USINT;
		CurrSpeed : USINT;
		CurrRollLeft : USINT;
		CurrRollRight : USINT;
	END_STRUCT;
END_TYPE

(*Manual page*)

TYPE
	Manual_type : 	STRUCT 
		JogLeftRight : JogLeftRight_type;
		JogMotors : JogMotors_type;
		PidTune : PidTune_type;
	END_STRUCT;
	JogLeftRight_type : 	STRUCT 
		Activate : BOOL;
		JogLeft : BOOL;
		JogRight : BOOL;
		SetBeltSpeedRight : USINT;
		SetBeltSpeedLeft : USINT;
		CurrSpeed : USINT;
	END_STRUCT;
	JogMotors_type : 	STRUCT 
		Motor1 : manMotor_type;
		Motor2 : manMotor_type;
		Motor3 : manMotor_type;
	END_STRUCT;
	PidTune_type : 	STRUCT 
		Motor1 : manTuneMotor_type;
		Motor2 : manTuneMotor_type;
		Motor3 : manTuneMotor_type;
	END_STRUCT;
	manMotor_type : 	STRUCT 
		Activate : BOOL;
		Home : BOOL;
		Speed : USINT;
		Left : BOOL;
		Right : BOOL;
	END_STRUCT;
	manTuneMotor_type : 	STRUCT 
		Autotune : BOOL;
		P : REAL;
		I : REAL;
	END_STRUCT;
END_TYPE

(*Charts*)

TYPE
	Charts_type : 	STRUCT 
		Dancer1 : REAL;
		Dancer2 : REAL;
		Vtape : REAL;
		Axis1 : REAL;
		Axis2 : REAL;
		Axis3 : REAL;
	END_STRUCT;
END_TYPE
