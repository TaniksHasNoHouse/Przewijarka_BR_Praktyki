
ACTION actConfigAxis2: 
		
	// Drugi Axis
	TensionConfigType[1].MotionSystem.AxisReference := gAxisString2;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Acceleration := 0.1;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Deceleration := 0.1;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.StopDeceleration := 8.0;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
	
END_ACTION
