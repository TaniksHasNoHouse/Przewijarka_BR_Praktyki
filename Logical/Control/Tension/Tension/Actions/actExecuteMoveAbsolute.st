
ACTION actExecuteMoveAbsolute: 
	GroupLineVelocity := gTension.GroupLineVelocity;
	TensionGroup.MoveVelocity := TRUE;
	IF TensionController[1].Info.ProcessedMaterial >= Distance THEN
		TensionGroup.StopLine := TRUE;
		GroupLineVelocity := 0.0;
		step := WAIT_FOR_COMMAND;
	END_IF;
END_ACTION
