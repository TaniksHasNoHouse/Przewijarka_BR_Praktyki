PROGRAM _INIT
	FOR i :=0 TO 1 DO
		DancerController[i].Enable := 0;
		DancerController[i].Configuration.Geometry.WinderWidth := 95.0;
		DancerController[i].Configuration.Geometry.MaterialThickness := 18.0;
		DancerController[i].Configuration.Geometry.MaxDiameter := 80.0;
		DancerController[i].Configuration.Geometry.MinDiameter := 30.0;
		DancerController[i].Configuration.Geometry.MinInertia := 0.00000001;
		DancerController[i].Configuration.Geometry.TestDiameter := 50.0;
		DancerController[i].Configuration.Geometry.TestInertia := 0.000001;
		DancerController[i].Configuration.Axis.LineUnits := 135617;
		DancerController[i].Configuration.Axis.WinderUnits := 360000; (* 1 winder (unit) == 0.001° *)
		DancerController[i].Configuration.Axis.RevMotor := 1;
		DancerController[i].Configuration.Axis.GearRatio := 3.0; (* gear ratio = 1 *)
		DancerController[i].Configuration.Axis.WinderType := mtWND_UNWIND; (* unwinding system *)
		DancerController[i].Parameters.PIDParameters.Gain := 2.0;
		DancerController[i].Parameters.PIDParameters.IntegrationTime := 1.0;
		DancerController[i].Parameters.PIDParameters.DerivativeTime := 0.0;
		DancerController[i].Parameters.PIDParameters.FilterTime := 0.0;
		DancerController[i].Parameters.MaxLineVelocityCorrection := 1000.0; (* == 1 m/s *)
		DancerController[i].Parameters.MaxControlError := 0.0; (* material break detection off *)
	
		SetDancerPosition := 10000.0;
		ActDiameter := DancerController[i].Configuration.Geometry.MaxDiameter;
	END_FOR;

END_PROGRAM
PROGRAM _CYCLIC
//	ActDencerPositionMilimeters1 := (ActDancerPosition1 *(1/DancerController[0].Configuration.Axis.LineUnits))/1000;
//	ActDencerPositionMilimeters2 := (ActDancerPosition2 *(1/DancerController[1].Configuration.Axis.LineUnits))/1000;
	FOR i := 0 TO 1 DO
		DancerController[i].Update := TRUE;
		DancerController[i].SetDancerPosition := SetDancerPosition;
		//DancerController[0].ActDancerPosition := ActDencerPositionMilimeters1;
		//DancerController[1].ActDancerPosition := ActDencerPositionMilimeters2;
		DancerController[0].ActDancerPosition := ActDancerPosition1;
		DancerController[1].ActDancerPosition := ActDancerPosition2;
		DancerController[i].ActDiameter := ActDiameter;
		DancerController[i]();
		VelocityCorrection := (DancerController[0].VelocityCorrection + DancerController[1].VelocityCorrection)/2;
		IF DancerController[i].UpdateDone THEN
			DancerController[i].Update := FALSE;
		END_IF;
	END_FOR;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

