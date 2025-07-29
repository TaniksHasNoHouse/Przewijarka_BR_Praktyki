
ACTION actLineInGroupVelocity: 
	IF TensionGroup.InLineVelocity  AND (((SetLeftDancerPos - 1) >= ActLeftDancerPosScal OR ActLeftDancerPosScal >= (SetLeftDancerPos + 1)) OR ((SetRightDancerPos - 1) >= ActRightDancerPosScal OR ActRightDancerPosScal >= (SetRightDancerPos + 1))) THEN
		TensionGroup.Control := TRUE;
	ELSE
		TensionGroup.Control := FALSE;
	END_IF;
	
END_ACTION
