
ACTION actConfigAxis3: 
		// Trzeci Axis
	TensionConfigType[2].MotionSystem.AxisReference := gAxisString3;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.Acceleration := 0.1;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.Deceleration := 0.1;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.StopDeceleration := 8.0;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
	
	TensionConfigType[2].Utilization.Winder.Width := 1000.0;
	TensionConfigType[2].Utilization.Winder.MinimumDiameter := 30.0;
	TensionConfigType[2].Utilization.Winder.MaximumDiameter := 80.0;
	TensionConfigType[2].Utilization.Winder.Winding := mpTENSION_WINDING_FROM_TOP;
	
	TensionConfigType[2].Controller.Type := mpTENSION_CONTROL_DANCER;
	TensionConfigType[2].Controller.Mode := mpTENSION_CONTROL_CLOSED_LOOP;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain := 10.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime := 1.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.DerivativeTime := 0.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.FilterTime := 0.0;
	TensionConfigType[2].Controller.MaximumVelocityCorrection := 60.0;
	TensionConfigType[2].Controller.ToleranceBand.Lower := 10.0;
	TensionConfigType[2].Controller.ToleranceBand.Upper := 10.0;
	TensionConfigType[2].Controller.Initialization.MaximumLineVelocityCorrection := 60.0;
	TensionConfigType[2].Controller.Initialization.SettlingTime := 1.0;
	TensionConfigType[2].Controller.Initialization.TimeOut := 1000.0;
	
	TensionConfigType[2].Material.Length := 0.4;
	TensionConfigType[2].Material.Thickness := 180.0;
	TensionConfigType[2].Material.Width := 48.0;
	TensionConfigType[2].Material.YoungsModulus := 400000000.0;
	TensionConfigType[2].Material.TensionLimit := 300.0;
	TensionConfigType[2].InputSignals.SetDancerPosition := SetRightDancerPos;
	TensionConfigType[2].InputSignals.ActualDancerPosition := ActRightDancerPosScal;
	
END_ACTION
