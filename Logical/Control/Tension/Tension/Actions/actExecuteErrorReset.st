
ACTION actExecuteErrorReset: 
	TensionGroup.ErrorReset := TRUE;
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
		TensionController[i].ErrorReset := TRUE;
	END_FOR;
	IF NOT TensionGroup.Error THEN
		FOR i := 0 TO INDEX_NR_OF_ZONES DO
			TensionController[i].ErrorReset := FALSE;
		END_FOR;
		TensionGroup.ErrorReset := FALSE;
		step := INIT;
	END_IF;
END_ACTION
