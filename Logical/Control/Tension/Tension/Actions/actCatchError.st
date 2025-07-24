
ACTION actCatchError: 
	IF TensionGroup.Error THEN
		step := ERROR;
	END_IF;
END_ACTION
