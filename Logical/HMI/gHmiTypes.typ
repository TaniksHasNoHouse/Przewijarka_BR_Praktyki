(*Zmienna glowna*)

TYPE
	HMI_type : 	STRUCT 
		Recipe : Recipe_type;
	END_STRUCT;
END_TYPE

(*Receptury*)

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
