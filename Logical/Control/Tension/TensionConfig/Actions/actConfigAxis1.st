ACTION actConfigAxis1:
	
	CASE StepPID1 OF
		START_PID1:
			TensionConfig[0].Load := TRUE;
			gHMI.Recipe.CurrentRecipe.Dencer1PID.P := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
			gHMI.Recipe.CurrentRecipe.Dencer1PID.I := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
			TensionConfig[0].Save := TRUE;
			StepPID1 := FINISH_PID1;
			
		FINISH_PID1:
			TensionConfig[0].Load := FALSE;
			TensionConfig[0].Save := FALSE;
			StepPID1 := WAIT_PID1;
		WAIT_PID1:
		
	END_CASE;
END_ACTION
