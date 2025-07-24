
ACTION actHomeTensionGroup: 
	TensionGroup.Home := TRUE;
	IF TensionGroup.IsHomed THEN
		TensionGroup.Home := FALSE;
		step := POWER;
	END_IF;
END_ACTION
