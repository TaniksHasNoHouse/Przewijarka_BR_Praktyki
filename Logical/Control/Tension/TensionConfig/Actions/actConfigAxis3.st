ACTION actConfigAxis3:
	



	CASE StepPID2 OF
		
		ACTIV_PID2:
			IF TensionConfig[2].Active THEN
				StepPID2 := START_PID2;
	  
			END_IF;
		
		START_PID2:
			TensionConfig[2].Load := TRUE;
			IF TensionConfig[2].CommandDone THEN
				TensionConfig[2].Load := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
				StepPID2 := WAIT_PID2;
			END_IF;
		
			
		WAIT_PID2:
			IF gHMI.Recipe.Load THEN
				StepPID2 := FINISH_PID2;
			END_IF;
			
		
		FINISH_PID2:
			TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain := gHMI.Recipe.CurrentRecipe.Dencer1PID.P;
			TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime := gHMI.Recipe.CurrentRecipe.Dencer1PID.I;
			TensionConfig[2].Save := TRUE;
			IF TensionConfig[2].CommandDone THEN
				TensionConfig[2].Save := FALSE;
				StepPID2 := WAIT_PID2;
			END_IF;

	END_CASE;
END_ACTION
