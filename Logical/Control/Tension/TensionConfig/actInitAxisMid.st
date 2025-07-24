
ACTION actInitAxisMid: 
	// Drugi Axis
	TensionConfigType[1].MotionSystem.AxisReference := gAxisString2;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Acceleration := 0.1;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.Deceleration := 0.5;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.StopDeceleration := 2.0;
	TensionConfigType[1].MotionSystem.AxisVelocityProfile.JerkTime := 0.0;
END_ACTION
