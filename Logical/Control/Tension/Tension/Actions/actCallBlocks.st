
ACTION actCallBlocks: 
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
		TensionController[i]();
		MpAxisBasicFB[i]();
	END_FOR;
	TensionGroup();
END_ACTION
