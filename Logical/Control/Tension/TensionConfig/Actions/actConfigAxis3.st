ACTION actConfigAxis3:
	
	CASE StepPID2 OF
		START_PID2:
			TensionConfig[2].Load := TRUE;
			gHMI.Recipe.CurrentRecipe.Dencer2PID.P := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
			gHMI.Recipe.CurrentRecipe.Dencer2PID.I := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
			TensionConfig[2].Save := TRUE;
			StepPID2 := FINISH_PID2;
			
		FINISH_PID2:
			TensionConfig[2].Load := FALSE;
			TensionConfig[2].Save := FALSE;
			StepPID2 := WAIT_PID2;
		WAIT_PID2:
	END_CASE;

END_ACTION
