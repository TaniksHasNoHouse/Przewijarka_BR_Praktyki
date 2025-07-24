
PROGRAM _INIT
	
	// Pierwszy Axis
	TensionConfigType[0].MotionSystem.AxisReference := gAxisString1;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.Acceleration := 0.5;
	TensionConfigType[0].MotionSystem.AxisVelocityProfile.Deceleration := 0.5;
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
	
	
	
	// Drugi Axis
	TensionConfigType[1].MotionSystem.AxisReference := gAxisString2;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Acceleration := 0.5;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Deceleration := 0.5;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.StopDeceleration := 2.0;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
	
	
	
	// Trzeci Axis
	TensionConfigType[2].MotionSystem.AxisReference := gAxisString3;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.Acceleration := 0.5;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.Deceleration := 0.5;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.StopDeceleration := 2.0;
	TensionConfigType[2].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
	
	TensionConfigType[2].Utilization.Winder.Width := 1000.0;
	TensionConfigType[2].Utilization.Winder.MinimumDiameter := 30.0;
	TensionConfigType[2].Utilization.Winder.MaximumDiameter := 80.0;
	TensionConfigType[2].Utilization.Winder.Winding := mpTENSION_WINDING_FROM_TOP;
	TensionConfigType[2].Utilization.DiameterEstimation.EstimationWindow := mpTENSION_EST_MODE_POSITION;
	
	TensionConfigType[2].Controller.Type := mpTENSION_CONTROL_DANCER;
	TensionConfigType[2].Controller.Mode := mpTENSION_CONTROL_CLOSED_LOOP;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.ProportionalGain := 5.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.IntegrationTime := 0.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.DerivativeTime := 0.0;
	TensionConfigType[2].Controller.PIDParameters.OperatingPoint1.FilterTime := 0.0;
	TensionConfigType[2].Controller.MaximumVelocityCorrection := 10.0;
	TensionConfigType[2].Controller.ToleranceBand.Lower := 4.0;
	TensionConfigType[2].Controller.ToleranceBand.Upper := 4.0;
	TensionConfigType[2].Controller.Initialization.MaximumLineVelocityCorrection := 10.0;
	TensionConfigType[2].Controller.Initialization.SettlingTime := 1.0;
	TensionConfigType[2].Controller.Initialization.TimeOut := 30.0;
	
	TensionConfigType[2].Material.Length := 0.4;
	TensionConfigType[2].Material.Thickness := 80.0;
	TensionConfigType[2].Material.Width := 48.0;
	TensionConfigType[2].Material.YoungsModulus := 400000000.0;
	TensionConfigType[2].Material.TensionLimit := 300.0;
	TensionConfigType[2].InputSignals.SetDancerPosition := SetRightDancerPos;
	TensionConfigType[2].InputSignals.ActualDancerPosition := ActRightDancerPosScal;
	
	
	// MpLink
	TensionConfig[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionConfig[1].MpLink := ADR(gTensionCtrl_Master);
	TensionConfig[2].MpLink := ADR(gTensionCtrl_Rewinder);
	
	TensionConfig[0].Enable := TRUE;
	TensionConfig[1].Enable := TRUE;
	TensionConfig[2].Enable := TRUE;
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	TensionConfig[0]();
	TensionConfig[1]();
	TensionConfig[2]();
	
END_PROGRAM

PROGRAM _EXIT

	TensionConfig[0].Enable := FALSE;
	TensionConfig[0]();
	
	TensionConfig[1].Enable := FALSE;
	TensionConfig[1]();
	
	TensionConfig[2].Enable := FALSE;
	TensionConfig[2]();
END_PROGRAM

