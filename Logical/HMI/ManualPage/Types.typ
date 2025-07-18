
TYPE
	HMIType : 	STRUCT 
		ManualPage : ManualPageType;
	END_STRUCT;
	ManualPageType : 	STRUCT 
		Buttons : ButtonsManual;
	END_STRUCT;
	ButtonsManual : 	STRUCT 
		Mot1Active : BOOL;
		Mot2Active : BOOL;
		Mot3Active : BOOL;
		Strings : BtnManualStrings;
	END_STRUCT;
	BtnManualStrings : 	STRUCT 
		ON : STRING[80];
		OFF : STRING[80];
		Btn1 : STRING[80];
		Btn2 : STRING[80];
		Btn3 : STRING[80];
	END_STRUCT;
END_TYPE
