ACTION actConfigAxis1:
	
	CASE StepPID1 OF
		START:
			gHMI.Recipe.CurrentRecipe.Dencer1PID.P := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.ProportionalGain;
			gHMI.Recipe.CurrentRecipe.Dencer1PID.I := TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.IntegrationTime;
			TensionConfig[0].Load := TRUE;
			TensionConfig[0].Save := TRUE;
			StepPID1 := FINISH;
			
		FINISH:
			TensionConfig[0].Load := FALSE;
			TensionConfig[0].Save := FALSE;
			StepPID1 := WAIT;
		WAIT:
		
	END_CASE;
END_ACTION
