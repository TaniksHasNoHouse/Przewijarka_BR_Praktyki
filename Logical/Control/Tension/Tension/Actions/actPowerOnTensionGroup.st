
ACTION actPowerOnTensionGroup: 
	TensionGroup.Power := TRUE;
	IF TensionGroup.PowerOn THEN
		step := WAIT_FOR_COMMAND;
	END_IF;
END_ACTION
