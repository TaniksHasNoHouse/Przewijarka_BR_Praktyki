
ACTION actLineInGroupVelocity: 
	IF TensionGroup.InLineVelocity THEN
		TensionGroup.Control := TRUE;
	ELSE
		TensionGroup.Control := FALSE;
	END_IF;
END_ACTION
