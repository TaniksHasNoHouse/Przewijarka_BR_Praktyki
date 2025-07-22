PROGRAM _INIT
    
	TensionController[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionController[1].MpLink := ADR(gTensionCtrl_Master);
	TensionController[2].MpLink := ADR(gTensionCtrl_Rewinder);
	TensionGroup.MpLink := ADR(gTensionGroup_1);
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := TRUE;

	END_FOR;
    
	GroupLineVelocity := 0.0;
  
END_PROGRAM

PROGRAM _CYCLIC
	IF TensionGroup.Error THEN
	  step := ERROR;
	END_IF;
	
	CASE step OF
		INIT:
			TensionGroup.Enable := TRUE;
			TensionGroup.Home := FALSE;
			TensionGroup.Power := FALSE;
			step := HOME;
		HOME:	
			TensionGroup.Home := TRUE;
			IF TensionGroup.IsHomed THEN
				TensionGroup.Home := FALSE;
				step := POWER;
			END_IF;
		POWER:
			TensionGroup.Power := TRUE;
			IF TensionGroup.PowerOn THEN
				step := WAIT_FOR_COMMAND;
			END_IF;
			
		WAIT_FOR_COMMAND:
			IF TensionGroup.InLineVelocity THEN
	  			TensionGroup.Control := TRUE;
			END_IF;
			
		ERROR:
			TensionGroup.Power := FALSE;
			step := ERROR_RESET;
		ERROR_RESET:
			TensionGroup.ErrorReset := TRUE;
			IF NOT TensionGroup.Error THEN
				TensionGroup.ErrorReset := FALSE;
				step := INIT;
			END_IF;

	END_CASE;
	
	Analog1;
	Analog2;
		
	TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i]();

	END_FOR;
     
END_PROGRAM

PROGRAM _EXIT
    
	TensionGroup.Enable := FALSE;
	TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := FALSE;
		TensionController[i]();

	END_FOR;
     
END_PROGRAM

