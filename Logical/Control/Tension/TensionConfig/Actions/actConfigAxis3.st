ACTION actConfigAxis3:
	
	CASE StepPID2 OF
		START:
			gHMI.Recipe.CurrentRecipe.Dencer2PID.P := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
			gHMI.Recipe.CurrentRecipe.Dencer2PID.I := TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
			TensionConfig[2].Load := TRUE;
			TensionConfig[2].Save := TRUE;
			StepPID2 := FINISH;
			
		FINISH:
			TensionConfig[2].Load := FALSE;
			TensionConfig[2].Save := FALSE;
			StepPID2 := WAIT;
		WAIT:
	END_CASE;

END_ACTION
