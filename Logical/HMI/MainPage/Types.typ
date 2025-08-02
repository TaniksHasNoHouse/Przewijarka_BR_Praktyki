
TYPE
	ButtonStyles_type : 	STRUCT 
		Start : STRING[80];
		Stop : STRING[80];
		Reset : STRING[80];
	END_STRUCT;
	ProductionBtn_type : 	STRUCT 
		Start : Buttons_type;
		Stop : Buttons_type;
		Reset : Buttons_type;
	END_STRUCT;
	Buttons_type : 	STRUCT 
		State : BOOL;
		ColorON : BOOL;
	END_STRUCT;
	PhysicalBtn_type : 	STRUCT 
		Manual : ManualBtn_type;
		Production : ProductionBtn_type;
	END_STRUCT;
	ManualBtn_type : 	STRUCT 
		Left : Buttons_type;
		Right : Buttons_type;
		ManProd : BOOL;
	END_STRUCT;
END_TYPE
