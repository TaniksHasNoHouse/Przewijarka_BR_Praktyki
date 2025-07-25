
ACTION actExecuteMoveAbsolute: 
	TensionGroup.MoveVelocity := TRUE;
	IF TensionController[1].Info.ProcessedMaterial >= Distance THEN
		TensionGroup.StopLine := TRUE;
		step := WAIT_FOR_COMMAND;
	END_IF;
END_ACTION
