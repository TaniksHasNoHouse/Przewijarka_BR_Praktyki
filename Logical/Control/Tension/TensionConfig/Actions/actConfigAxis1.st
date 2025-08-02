ACTION actConfigAxis1:
	
	CASE StepPID1 OF
		
		ACTIV_PID1:
			IF TensionConfig[0].Active THEN
				StepPID1 := START_PID1;
			END_IF;
		
			
		START_PID1:
			TensionConfig[0].Load := TRUE;
			IF TensionConfig[0].CommandDone THEN
				TensionConfig[0].Load := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
				StepPID1 := WAIT_PID1;
			END_IF;
		
			
		WAIT_PID1:
			IF gHMI.Recipe.Load THEN
				StepPID1 := FINISH_PID1;
			END_IF;
		
		FINISH_PID1:
			TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.ProportionalGain := gHMI.Recipe.CurrentRecipe.Dencer1PID.P;
			TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.IntegrationTime := gHMI.Recipe.CurrentRecipe.Dencer1PID.I;
			TensionConfig[0].Save := TRUE;
			IF TensionConfig[0].CommandDone THEN
				TensionConfig[0].Save := FALSE;
				StepPID1 := WAIT_PID1;
			END_IF;

	END_CASE;
END_ACTION
