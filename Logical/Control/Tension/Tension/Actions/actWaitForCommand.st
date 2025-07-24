
ACTION actWaitForCommand:
	TensionGroup.MoveVelocity := TRUE;
	IF MV_ABS AND TensionController[1].Info.ProcessedMaterial < Distance THEN
		step := MOVE_ABSOLUTE;
		TensionGroup.StopLine := FALSE;
	END_IF;
END_ACTION
