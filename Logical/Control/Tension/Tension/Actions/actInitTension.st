
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
	
	TensionController[0].PresetDiameter := 80.0;
	TensionController[2].PresetDiameter := 30.0;
	TensionController[0].SetPresetDiameter := TRUE;
	TensionController[2].SetPresetDiameter := TRUE;
	gTensionLogic.Cmd.SetLeftDancerPos := 30.0;
	gTensionLogic.Cmd.SetRightDancerPos := 30.0;
END_ACTION
