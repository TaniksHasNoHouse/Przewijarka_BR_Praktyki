PROGRAM _INIT
    
	TensionController[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionController[1].MpLink := ADR(gTensionCtrl_TransportDancer);
	TensionController[2].MpLink := ADR(gTensionCtrl_Rewinder);
	TensionGroup.MpLink := ADR(gTensionGroup_1);
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := TRUE;

	END_FOR;
    
	GroupLineVelocity := 0.0;
  
END_PROGRAM

PROGRAM _CYCLIC
    
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

