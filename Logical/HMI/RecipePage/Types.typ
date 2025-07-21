
TYPE
	MaterialWindingRec_type : 	STRUCT 
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
	END_STRUCT;
	MotorPID_type : 	STRUCT 
		P : REAL := 0.0;
		I : REAL := 0.0;
	END_STRUCT;
	MaxMinRollSize_type : 	STRUCT 
		MaxSize : REAL := 0.0;
		MinSize : REAL := 0.0;
	END_STRUCT;
	ImageDirectory_type : 	STRUCT 
		LeftArrow : STRING[80];
		RightArrow : STRING[80];
		On : STRING[80];
		Off : STRING[80];
		Current : CurrentImage_type;
	END_STRUCT;
	CurrentImage_type : 	STRUCT 
		CurrentArrow : STRING[80];
		CurrentOnOff : STRING[80];
	END_STRUCT;
END_TYPE
