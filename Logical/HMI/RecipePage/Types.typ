
TYPE
	TableControl_type : 	STRUCT 
		Config : STRING[80] := '{"specRows": [{"from":11, "to":20, "visible":false}]}';
		Offset : UINT;
	END_STRUCT;
	Edit_type : 	STRUCT 
		SaveRecipe : BOOL;
		DialogOpen : BOOL;
	END_STRUCT;
	RecipeControl_type : 	STRUCT 
		Edit : Edit_type;
		LoadRecipe : STRING[80] := '0';
		TableControl : TableControl_type;
	END_STRUCT;
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
	RecipeCreateSteps : 
		( (*Steps for creating recipes*)
		IDLE := 0, (*Idle State *)
		CREATE_1 := 10, (*Create coffee mappRegular*)
		DONE_1 := 11, (*mappRegular was created*)
		CREATE_2 := 20, (*Create coffee mappEspresso*)
		DONE_2 := 21, (*mappEspresso was created*)
		CREATE_3 := 30, (*Create coffee mappCappuccino*)
		DONE_3 := 31, (*mappCappuccino was created*)
		CREATE_4 := 40, (*Create coffee mappMilkCoffee*)
		DONE_4 := 41, (*mappMilkCoffee was created*)
		REFRESH := 42,
		LOAD := 43,
		ALL_DONE := 50 (*All recipes were created*)
		);
END_TYPE
