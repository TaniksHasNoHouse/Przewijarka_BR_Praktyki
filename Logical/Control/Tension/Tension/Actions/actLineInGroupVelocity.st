
ACTION actLineInGroupVelocity: 
	IF TensionGroup.MoveVelocity THEN // AND (((SetLeftDancerPos - 1) >= ActLeftDancerPosScal OR ActLeftDancerPosScal >= (SetLeftDancerPos + 1)) OR ((SetRightDancerPos - 1) >= ActRightDancerPosScal OR ActRightDancerPosScal >= (SetRightDancerPos + 1))) THEN
		TensionGroup.Control := TRUE;
		gMainLogic.MotorMode.Production.Status.TensionReady := TRUE;
		gMainLogic.MotorMode.Production.Status.TensionStable := FALSE;
	ELSE
		TensionGroup.Control := FALSE;
		gMainLogic.MotorMode.Production.Status.TensionReady := FALSE;
		gMainLogic.MotorMode.Production.Status.TensionStable := TRUE;
	END_IF;
	
END_ACTION
