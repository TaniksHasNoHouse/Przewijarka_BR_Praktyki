
ACTION actExitTension: 
	TensionGroup.Enable := FALSE;
	TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := FALSE;
		TensionController[i]();
		MpAxisBasicFB[i].Enable := TRUE;
		MpAxisBasicFB[i]();

	END_FOR;
END_ACTION
