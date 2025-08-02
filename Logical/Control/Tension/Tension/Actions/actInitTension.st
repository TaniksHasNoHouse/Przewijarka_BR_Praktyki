
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
		MpAxisBasicFB[i].Enable := TRUE;
		
	END_FOR;
	
	TensionController[0].PresetDiameter := LeftWinderDiameter;
	TensionController[2].PresetDiameter := RightWinderDiameter;
	TensionController[0].SetPresetDiameter := TRUE;
	TensionController[2].SetPresetDiameter := TRUE;
	TensionGroup.Enable := TRUE;
	MpAxisBasicFB[0].MpLink := ADR(gAxis_1);
	MpAxisBasicFB[1].MpLink := ADR(gAxis_2);
	MpAxisBasicFB[2].MpLink := ADR(gAxis_3);
	
	MpAxisBasicFB[0].Parameters := ADR(MpAxisBasicParams[0]);
	MpAxisBasicFB[1].Parameters := ADR(MpAxisBasicParams[1]);
	MpAxisBasicFB[2].Parameters := ADR(MpAxisBasicParams[2]);
	
END_ACTION
