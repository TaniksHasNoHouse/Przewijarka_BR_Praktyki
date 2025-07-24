
ACTION actConfigAxis1: 
		// Pierwszy Axis
	TensionConfigType[0].MotionSystem.AxisReference := gAxisString1;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.Acceleration := 0.2;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.Deceleration := 0.2;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.StopDeceleration := 2.0;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
	
	TensionConfigType[0].Utilization.Winder.Width := 1000.0;
	TensionConfigType[0].Utilization.Winder.MinimumDiameter := 30.0;
	TensionConfigType[0].Utilization.Winder.MaximumDiameter := 80.0;
	TensionConfigType[0].Utilization.Winder.Winding := mpTENSION_WINDING_FROM_TOP;
	TensionConfigType[0].Utilization.DiameterEstimation.EstimationWindow := mpTENSION_EST_MODE_POSITION;
	
	TensionConfigType[0].Controller.Type := mpTENSION_CONTROL_DANCER;
	TensionConfigType[0].Controller.Mode := mpTENSION_CONTROL_CLOSED_LOOP;
	TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.ProportionalGain := 5.0;
	TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.IntegrationTime := 0.0;
	TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.DerivativeTime := 0.0;
	TensionConfigType[0].Controller.PIDParameters.OperatingPoint1.FilterTime := 0.0;
	TensionConfigType[0].Controller.MaximumVelocityCorrection := 10.0;
	TensionConfigType[0].Controller.ToleranceBand.Lower := 4.0;
	TensionConfigType[0].Controller.ToleranceBand.Upper := 4.0;
	TensionConfigType[0].Controller.Initialization.MaximumLineVelocityCorrection := 10.0;
	TensionConfigType[0].Controller.Initialization.SettlingTime := 1.0;
	TensionConfigType[0].Controller.Initialization.TimeOut := 30.0;
	
	TensionConfigType[0].Material.Length := 0.4;
	TensionConfigType[0].Material.Thickness := 80.0;
	TensionConfigType[0].Material.Width := 48.0;
	TensionConfigType[0].Material.YoungsModulus := 400000000.0;
	TensionConfigType[0].Material.TensionLimit := 300.0;
	TensionConfigType[0].InputSignals.SetDancerPosition := SetLeftDancerPos;
	TensionConfigType[0].InputSignals.ActualDancerPosition := ActLeftDancerPosScal;
	
END_ACTION
