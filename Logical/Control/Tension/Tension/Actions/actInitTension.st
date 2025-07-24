
ACTION actInitTension: 
	gAxis_1;
	gAxis_2;
	gAxis_3;
	
	TensionController[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionController[1].MpLink := ADR(gTensionCtrl_Master);
	TensionController[2].MpLink := ADR(gTensionCtrl_Rewinder);
	TensionGroup.MpLink := ADR(gTensionGroup_1);

	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := TRUE;
		
	END_FOR;
    
	GroupLineVelocity := 0.0;
	SetLeftDancerPos := 30.0;
	SetRightDancerPos := 30.0;
	Distance := 0.1;
END_ACTION
