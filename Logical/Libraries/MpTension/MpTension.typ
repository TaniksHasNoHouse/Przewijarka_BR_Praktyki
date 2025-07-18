(************ MpTension Enumerations*)

TYPE
	MpTensionControllerFeatureEnum : 
		( (*Possible features for the controller.*)
		mpTENSION_FEAT_FEED_FORWARD := 0, (*Feature for feed-forward control of the motor torque.*)
		mpTENSION_FEAT_SPEED_CONTROLLER := 1 (*Feature to adjust the parameters for the velocity controller.*)
		);
	MpTensionMaterialEnum : 
		( (*Possible material types.*)
		mpTENSION_MATERIAL_WEB := 0, (*The material is a web.*)
		mpTENSION_MATERIAL_WIRE := 1, (*The material is a wire.*)
		mpTENSION_MATERIAL_GRP_SETTINGS := 2 (*The material is a wire.*)
		);
	MpTensionControlModeEnum : 
		( (*Possible modes for the closed-loop controller.*)
		mpTENSION_CONTROL_CLOSED_LOOP := 0, (*Tension is built up by feeding back from the controlled variable.*)
		mpTENSION_CONTROL_OPEN_LOOP := 1 (*Tension is built up through the application of feed-forward torque on the motor.*)
		);
	MpTensionControlStateEnum : 
		( (*Tension control states.*)
		mpTENSION_STATE_WAIT := 0, (*A movement can be started.*)
		mpTENSION_STATE_SYNC_TO_LINE := 1, (*The axis performs a movement and is synchronized with the specified velocity. The axis can also remain in this state at speed "0".*)
		mpTENSION_STATE_INIT_ZONE_CTRL := 2, (*The material tension is being built up.*)
		mpTENSION_STATE_IN_OPERATION := 3, (*The material tension has been built up.*)
		mpTENSION_STATE_STOP := 4, (*The axis movement is stopped.*)
		mpTENSION_STATE_ERROR_STOP := 5, (*An error has occurred. The axis movement is stopped.*)
		mpTENSION_STATE_ERROR_CTRL := 6 (*An error has occurred. Closed-loop control was disabled and the axis is synchronized with the specified velocity.*)
		);
	MpTensionControlTypeEnum : 
		( (*Possible tension control methods.*)
		mpTENSION_CONTROL_TENSION := 0, (*The variable to be controlled is the tension in the material.*)
		mpTENSION_CONTROL_DANCER := 1, (*The variable to be controlled is the position of a dancer.*)
		mpTENSION_CONTROL_IN_GEAR := 2, (*The axis is coupled to the line.*)
		mpTENSION_CONTROL_MASTER := 3 (*The axis is defined as the group master, which follows the specified velocity without correction.*)
		);
	MpTensionDiameterEstModeEnum : 
		( (*Possible methods of calculating the diameter.*)
		mpTENSION_EST_MODE_POSITION := 0, (*Diameter estimation based on differences in position.*)
		mpTENSION_EST_MODE_VELOCITY := 1 (*Diameter estimation based on integrated velocities.*)
		);
	MpTensionDriveSimulationEnum : 
		( (*Possible drive simulations.*)
		mpTENSION_DRIVE_SIM_COMPLETE := 0 (*Complete simulation of a controlled system.*)
		);
	MpTensionGroupFeatureEnum : 
		( (*Possible features for the group.*)
		mpTENSION_FEAT_INIT_ORDER := 0 (*Feature that determines the initialization sequence.*)
		);
	MpTensionInitSequenceEnum : 
		( (*Possible modes for the initialization sequence.*)
		mpTENSION_INIT_ORDER_SERIAL := 0, (*A group controller is initialized in sequence, starting from the master.*)
		mpTENSION_INIT_ORDER_USER := 1 (*The initialization sequence of the controllers must be defined by the user.*)
		);
	MpTensionMotionSystemEnum : 
		( (*Available drive systems.*)
		mpTENSION_MAPP_MOTION := 0, (*mapp Motion is used to control the axes.*)
		mpTENSION_USER_DEFINED_MOTION := 1 (*The user is responsible for communication with the axis.*)
		);
	MpTensionOrientationEnum : 
		( (*Methods for controlling the tension upstream or downstream.*)
		mpTENSION_ORIENTATION_UPSTREAM := 0, (*The tension in the material is controlled upstream.*)
		mpTENSION_ORIENTATION_DOWNSTREAM := 1 (*The tension in the material is controlled downstream.*)
		);
	MpTensionSimulationEnum : 
		( (*Possible simulations.*)
		mpTENSION_SIM_NOT_USED := 0, (*The simulation is not used.*)
		mpTENSION_SIM_MATERIAL_DRIVE := 1, (*The axes and the material are being simulated.*)
		mpTENSION_SIM_MATERIAL := 2 (*Only the material is being simulated.*)
		);
	MpTensionTaperTensionEnum : 
		( (*possible tension curve methods.*)
		mpTENSION_TAPER_LINEAR_TENSION := 0, (*Linear reduction of the tension.*)
		mpTENSION_TAPER_LINEAR_TORQUE := 1 (*Linear reduction of the motor torque.*)
		);
	MpTensionUtilizationTypeEnum : 
		( (*Possible functionalities of the axis.*)
		mpTENSION_UTILIZATION_UNWIND := 0, (*The axis is used for unwinding the material.*)
		mpTENSION_UTILIZATION_TRANSPORT := 1, (*The axis is used to transport the material.*)
		mpTENSION_UTILIZATION_REWIND := 2 (*The axis is used for winding the material.*)
		);
	MpTensionWinderTypeEnum : 
		( (*Possible winding system methods.*)
		mpTENSION_WINDER_TYPE_CENTER := 0, (*This is a center winder.*)
		mpTENSION_WINDER_TYPE_SURFACE := 1 (*This is a surface winder.*)
		);
	MpTensionWindingEnum : 
		( (*Possible types of material winding.*)
		mpTENSION_WINDING_FROM_TOP := 0, (*The material is fed into or out of the winder axis from above.*)
		mpTENSION_WINDING_FROM_BOTTOM := 1 (*The material is fed into or out of the winder axis from below.*)
		);
	MpTensionPIDAdjustmentEnum : 
		( (*Possible adjustments of the PID parameters of the controller.*)
		mpTENSION_ADJUSTMENT_NOT_USED := 0, (*The selected operating point is used without adjustment.*)
		mpTENSION_ADJUSTMENT_INTERPOLATE := 1 (*All operating points are used for interpolation.*)
		);
END_TYPE

(************ MpTensionController Main Configuration*)

TYPE
	MpTensionControllerConfigType : 	STRUCT  (*Configuration parameters for the controller.*)
		MotionSystem : MpTensionMotionSystemType; (*Parameter for the used motion system.*)
		Utilization : MpTensionUtilizationType; (*Parameter for the axis functionality.*)
		Controller : MpTensionControlSystemType; (*Parameter for the system to be controlled.*)
		Material : MpTensionControllerMaterialType; (*Parameter for the material.*)
		InputSignals : MpTensionControllerInSignalType; (*Data points for the input signals.*)
		OutputSignals : MpTensionControllerOutSignalType; (*Data points for the output signals.*)
		Features : MpTensionControllerFeatureType; (*References from feature configurations.*)
	END_STRUCT;
END_TYPE

(************ MpTensionController Groups*)

TYPE
	MpTensionMotionSystemType : 	STRUCT  (*Parameters for the used motion system.*)
		Type : MpTensionMotionSystemEnum := mpTENSION_USER_DEFINED_MOTION; (*Defines which motion system is used.*)
		AxisReference : STRING[32]; (*Axis object reference.*)
		AxisVelocityProfile : MpTensionVelocityProfileType; (*Parameter for the axis velocity profile.*)
		Gearbox : MpTensionGearboxType; (*Parameter for the gearbox*)
		DriveSimulation : MpTensionDriveSimulationType; (*Parameter for simulating the axis.*)
	END_STRUCT;
	MpTensionUtilizationType : 	STRUCT  (*Parameters for the functionality of the axis.*)
		Type : MpTensionUtilizationTypeEnum := mpTENSION_UTILIZATION_UNWIND; (*Defines the axis functionality.*)
		Diameter : REAL := 100.0; (*Constant diameter of the transport axis [mm].*)
		Winder : MpTensionWinderType; (*Configuration parameter for the winder axis.*)
		DiameterEstimation : MpTensionDiameterEstimationType; (*Diameter estimation methods.*)
		TaperTension : MpTensionTaperTensionType; (*Parameter for adjusting the tension.*)
	END_STRUCT;
	MpTensionControlParameterSetType : 	STRUCT  (*Parameters for the operating point.*)
		Adjustment : MpTensionPIDAdjustmentEnum; (*Defines how the operating points are used.*)
		UsedOperatingPoint : USINT; (*Defines which operating point is used.*)
		OperatingPoint1 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint2 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint3 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint4 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint5 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint6 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint7 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint8 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint9 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
		OperatingPoint10 : MpTensionControllerPIDParType; (*PID parameter for the operating point.*)
	END_STRUCT;
	MpTensionControlSystemType : 	STRUCT  (*Parameters for the system to be controlled.*)
		Type : MpTensionControlTypeEnum := mpTENSION_CONTROL_TENSION; (*Tension control methods.*)
		Mode : MpTensionControlModeEnum := mpTENSION_CONTROL_CLOSED_LOOP; (*Defines the controller mode. This parameter is used for tension control mpTENSION_CONTROL_TENSION.*)
		PIDParameters : MpTensionControlParameterSetType; (* Tension controller parameter sets. *)
		MaximumVelocityCorrection : REAL := 10.0; (*Maximum permissible correction velocity via the controller [m/s].*)
		VelocityOffset : REAL := 0.0; (*Velocity offset compared to the configured line velocity for the group, as a percentage [%].*)
		DancerSimulation : MpTensionDancerSimulationType; (*Parameter for the dancer simulation.*)
		Orientation : MpTensionOrientationEnum := mpTENSION_ORIENTATION_UPSTREAM; (*Defines whether the material tension is controlled upstream or downstream.*)
		ToleranceBand : MpTensionToleranceBandType; (*Parameter for the tolerance band.*)
		Initialization : MpTensionInitializationType; (*Parameter for initialization.*)
	END_STRUCT;
	MpTensionControllerMaterialType : 	STRUCT  (*Parameters for defining the material.*)
		Type : MpTensionMaterialEnum := mpTENSION_MATERIAL_WEB; (*Defines the type of material.*)
		Length : REAL := 3.0; (*Length of the material inside the zone [m].*)
		Thickness : REAL := 80.0; (*Thickness of the material [um].*)
		Width : REAL := 1000.0; (*Width of the material [mm].*)
		Diameter : REAL := 10.0; (*Diameter of the material [mm].*)
		YoungsModulus : REAL := 4.0E8; (*Elastic modulus of the material [N/m^2].*)
		TensionLimit : REAL := 2000.0; (*Material tension limit [N].*)
	END_STRUCT;
	MpTensionControllerInSignalType : 	STRUCT  (*Data points for the input signal.*)
		LineVelocity : STRING[255]; (*Velocity setpoint for the line [m/min].*)
		ActualAxisPosition : STRING[255]; (*Current axis position [rev].*)
		ActualAxisVelocity : STRING[255]; (*Current axis velocity [rpm].*)
		ActualLinePosition : STRING[255]; (*Current line position [m].*)
		ActualLineVelocity : STRING[255]; (*Current line velocity [m/min].*)
		SetMaterialTension : STRING[255]; (*Setpoint for the material tension [N].*)
		ActualMaterialTension : STRING[255]; (*Current tension of the material [N].*)
		SetDancerPosition : STRING[255]; (*Setpoint for the dancer position [mm].*)
		ActualDancerPosition : STRING[255]; (*Current position of the dancer [mm].*)
		ActualDancerForce : STRING[255]; (*The current tension of the material, which is generated by the dancer [N].*)
		AdditiveTorque : STRING[255]; (* torque for the axis [N m].*)
		AdditiveForce : STRING[255]; (* force that affects the motor [N].*)
		ActualDiameter : STRING[255]; (*Current winder axis diameter [mm].*)
		PowerOn : STRING[255]; (*Axis state, i.e. whether the axis is switched on or off.*)
		IsHomed : STRING[255]; (*Axis state, i.e. whether the axis is homed.*)
	END_STRUCT;
	MpTensionControllerOutSignalType : 	STRUCT  (*Data points for the output signal.*)
		SetAxisVelocity : STRING[255]; (*Axis velocity setpoint [units/s].*)
		SetMotorTorque : STRING[255]; (*Motor torque setpoint [Nm].*)
		Power : STRING[255]; (*Indicates whether the axis must be switched on or off.*)
		Home : STRING[255]; (*Indicates whether the axis must be homed.*)
	END_STRUCT;
	MpTensionControllerFeatureType : 	STRUCT  (*References for the TensionControllerFeature configurations.*)
		FeatureReference1 : STRING[32]; (*Reference for a TensionControllerFeature configuration.*)
		FeatureReference2 : STRING[32]; (*Reference for a TensionControllerFeature configuration.*)
	END_STRUCT;
END_TYPE

(************ MpTensionController Subgroups*)

TYPE
	MpTensionGearboxType : 	STRUCT  (*Parameters for the definition of a gear ratio for the axis.*)
		Input : UDINT := 1; (*Number of revolutions on the encoder side.*)
		Output : UDINT := 1; (*Number of revolutions on the load side, which corresponds to the number of rotations on the encoder side.*)
	END_STRUCT;
	MpTensionDriveSimulationType : 	STRUCT  (*Parameters for simulation of the axis.*)
		Mode : MpTensionDriveSimulationEnum; (*Defines the drive simulation mode.*)
		SpeedController : MpTensionSpeedControllerParType; (*Parameter for the velocity controller.*)
		AxisParameters : MpTensionAxisParType; (*Parameter for the axis.*)
	END_STRUCT;
	MpTensionSpeedControllerParType : 	STRUCT  (*Parameters for the velocity controller for the axis.*)
		ProportionalGain : REAL := 10.0; (*Proportional gain [1/s].*)
		IntegrationTime : REAL := 0.1; (*Integration time (integral action time) of the integral component [s].*)
	END_STRUCT;
	MpTensionAxisParType : 	STRUCT  (*Parameters for an axis.*)
		MotorTorqueConstant : REAL := 4.2; (*Torque constant of the motor [Nm/A].*)
		Inertia : REAL := 0.5; (*Moment of inertia of the motor [kgm^2].*)
		ViscousFriction : REAL := 10.0; (* Viscous friction of the motor [Nms]. *)
	END_STRUCT;
	MpTensionWinderType : 	STRUCT  (*Parameters for the winder axis.*)
		Type : MpTensionWinderTypeEnum := mpTENSION_WINDER_TYPE_CENTER; (*Defines the winder system.*)
		Width : REAL := 1000.0; (*Winder width [mm].*)
		Diameter : REAL := 100.0; (*Diameter of the driven axis [mm].*)
		MinimumDiameter : REAL := 100.0; (*Minimum winder diameter [mm].*)
		MaximumDiameter : REAL := 1000.0; (*Maximum winder diameter [mm].*)
		Winding : MpTensionWindingEnum := mpTENSION_WINDING_FROM_TOP; (*Specifies whether the material is wound from above or from below.*)
	END_STRUCT;
	MpTensionDiameterEstimationType : 	STRUCT  (*Parameters for the winder axis.*)
		Mode : MpTensionDiameterEstModeEnum := mpTENSION_EST_MODE_POSITION; (*Diameter estimation methods.*)
		EstimationWindow : REAL := 360.0; (*Duration of the cyclic estimation window for estimating the diameter [°].*)
		FilterTime : REAL := 0.1; (*Filter time for diameter estimation [s]. Only used when material is a wire.*)
	END_STRUCT;
	MpTensionTaperTensionType : 	STRUCT  (*Parameters for the tension curve.*)
		Enable : BOOL := FALSE; (*Enables/disables adjustment of the tension in the material.*)
		StartDiameter : REAL := 300.0; (*Once this diameter has been reached, the tension in the material is reduced [mm].*)
		MinimumMaterialTension : REAL := 100.0; (*Minimale Zugkraft im material [N].*)
		MaximumMaterialTension : REAL := 200.0; (*Maximale Zugkraft im material [N].*)
		Mode : MpTensionTaperTensionEnum := mpTENSION_TAPER_LINEAR_TENSION; (*Definiert die Methode des Zugkraftverlaufes.*)
	END_STRUCT;
	MpTensionControllerPIDParType : 	STRUCT  (*Parameters for the PID controller.*)
		ProportionalGain : REAL := 2.0; (*Proportional gain.*)
		IntegrationTime : REAL := 0.5; (*Integration time (integral action time) of the integral component [s].*)
		DerivativeTime : REAL := 0.0; (*Derivative time (derivative time) of the derivative component [s].*)
		FilterTime : REAL := 0.0; (*Filter time constant of the derivative component [s].*)
		LineVelocity : REAL; (*Line velocity at which the PID parameters were found [m/min].*)
	END_STRUCT;
	MpTensionDancerSimulationType : 	STRUCT  (*Parameters for dancer simulation.*)
		DancerMass : REAL := 20.0; (*Dancer roll mass [kg].*)
		DancerDamping : REAL := 50.0; (*Damping of dancer roll [kg/s].*)
		MinimumDancerPosition : REAL := -100.0; (*Minimum position of the dancer roll [mm].*)
		MaximumDancerPosition : REAL := 100.0; (*Maximum position of the dancer roll [mm].*)
	END_STRUCT;
	MpTensionToleranceBandType : 	STRUCT  (*Parameters for the tolerance band.*)
		Lower : REAL := 2.0; (*Difference between the controlled variable and the setpoint, which defines the lower limit of the tolerance band [N], [mm].*)
		Upper : REAL := 2.0; (*Difference between the controlled variable and the setpoint, which defines the upper limit of the tolerance band [N], [mm]. *)
	END_STRUCT;
	MpTensionInitializationType : 	STRUCT  (*Parameters for initialization.*)
		Enable : BOOL := TRUE; (*Switches initialization on/off.*)
		MaximumLineVelocityCorrection : REAL := 5.0; (*Maximum line velocity correction for the axis [m/min].*)
		SettlingTime : REAL := 1.0; (*Time taken to check whether the variable to be controlled is stable [s].*)
		TimeOut : REAL := 30.0; (*Maximum period of time for initialization [s]. If the controlled variable does not stabilize after this period, the controller is disabled.*)
	END_STRUCT;
	MpTensionVelocityProfileType : 	STRUCT  (*Parameters for the velocity profile used.*)
		Acceleration : REAL := 0.4; (*Maximum acceleration [m/s^2].*)
		Deceleration : REAL := 0.4; (*Maximum deceleration [m/s^2].*)
		StopDeceleration : REAL := 0.8; (*Maximum deceleration for a stop movement [m/s^2].*)
		JerkTime : REAL := 1.0; (*Limit for acceleration slew rate [s].*)
	END_STRUCT;
END_TYPE

(*--------------- MpTensionControllerFeatureConfig*)

TYPE
	MpTensionCtrlFeatureConfigType : 	STRUCT  (*Parameters for a controller feature.*)
		Type : MpTensionControllerFeatureEnum := mpTENSION_FEAT_FEED_FORWARD; (*Defines the feature type.*)
		FeedForward : MpTensionFeedForwardFeatureType; (*Parameter for feed-forward control of the motor.*)
		AdjustSpeedController : MpTensionAdjustSpeedFeatureType; (*Parameter for adjusting the velocity controller.*)
	END_STRUCT;
	MpTensionAdjustSpeedFeatureType : 	STRUCT  (*Parameters for the velocity controller.*)
		MinimumProportionalGain : REAL := 1.0; (*Proportional gain of the velocity controller with minimum diameter [As].*)
		MinimumIntegrationTime : REAL := 0.1; (*Integration time of the velocity controller with minimum diameter [s].*)
		TestDiameter : REAL := 800.0; (*Winder diameter between the minimum and maximum diameter at which parameters "TestProportionalGain" and "TestIntegrationTime" are calculated [mm]. Ideally, this diameter should be equal in size to "Maximum diameter".*)
		TestProportionalGain : REAL := 3.0; (*Proportional gain of the velocity controller with diameter "TestDiameter" [As].*)
		TestIntegrationTime : REAL := 0.05; (*Integration time of the velocity controller with diameter "TestDiameter" [s].*)
	END_STRUCT;
	MpTensionFeedForwardFeatureType : 	STRUCT  (*Parameters for feed-forward control of the motor.*)
		MinimumInertia : REAL := 0.1; (*Moment of inertia of the winder at the minimum diameter [kgm^2].*)
		MinimumTorque : REAL := -50.0; (*Lower limit value for the motor torque default value [N m]. *)
		TestDiameter : REAL := 800.0; (*Winder diameter between minimum and maximum diameter, at which parameter "TestInertia" is calculated [mm]. Ideally, this diameter should be equal in size to "Maximum diameter". *)
		TestInertia : REAL := 0.5; (*Moment of inertia of the winder at diameter "TestDiameter" [kgm^2].*)
		MaximumTorque : REAL := 50.0; (*Upper limit value for the motor torque default value [N m].*)
	END_STRUCT;
END_TYPE

(************ MpTensionGroup Main Configuration*)

TYPE
	MpTensionGroupConfigType : 	STRUCT  (*Configuration parameters for the group.*)
		Simulation : MpTensionSimulationEnum := mpTENSION_SIM_NOT_USED; (*Defines the simulation mode.*)
		LineVelocityProfile : MpTensionVelocityProfileType; (*Parameter for the used profile.*)
		CommonZoneSettings : MpTensionCommonZoneSettingsType; (*Parameters for the common zone settings.*)
		InputSignals : MpTensionGroupInSignalType; (*Data points for the input signals.*)
		Features : MpTensionGroupFeatureType; (*References from feature configurations.*)
	END_STRUCT;
END_TYPE

(************ MpTensionGroup Groups*)

TYPE
	MpTensionGroupFeatureType : 	STRUCT  (*References for TensionGroupFeature configurations.*)
		FeatureReference1 : STRING[32]; (*Reference for a TensionGroupFeature configuration.*)
	END_STRUCT;
	MpTensionCommonZoneSettingsType : 	STRUCT  (*Parameters for the common zone settings.*)
		Material : MpTensionGroupMaterialType; (*Parameter for the material.*)
	END_STRUCT;
	MpTensionGroupInSignalType : 	STRUCT  (*Data points for the input signal.*)
		GroupLineVelocity : STRING[255]; (*Velocity setpoint for the line [m/min].*)
	END_STRUCT;
END_TYPE

(************ MpTensionGroup Subgroups*)

TYPE
	MpTensionGroupMaterialType : 	STRUCT  (*Parameters for defining the material.*)
		Type : MpTensionMaterialEnum := mpTENSION_MATERIAL_WEB; (*Defines the type of material.*)
		Thickness : REAL := 80.0; (*Thickness of the material [um].*)
		Width : REAL := 1000.0; (*Width of the material [mm].*)
		Diameter : REAL := 10.0; (*Diameter of the material [mm].*)
		YoungsModulus : REAL := 4.0E8; (*Elastic modulus of the material [N/m^2].*)
		TensionLimit : REAL := 2000.0; (*Material tension limit [N].*)
	END_STRUCT;
END_TYPE

(*--------------- MpTensionGroupFeatureConfig*)

TYPE
	MpTensionGroupFeatureConfigType : 	STRUCT  (*Configuration parameters for a group feature.*)
		Type : MpTensionGroupFeatureEnum := mpTENSION_FEAT_INIT_ORDER; (*Defines the feature type.*)
		InitializationOrder : MpTensionInitOrderFeatureType; (*Parameter for the initialization sequence.*)
	END_STRUCT;
	MpTensionInitOrderFeatureType : 	STRUCT  (*Parameters for the initialization sequence.*)
		Mode : MpTensionInitSequenceEnum := mpTENSION_INIT_ORDER_SERIAL; (*Initialization mode.*)
		NumberOfGroups : UINT; (*Number of initialization groups.*)
		Groups : {REDUND_UNREPLICABLE} UDINT; (*List of initialization groups. The size of the array is not permitted to be less than the size defined via "NumberOfGroups".*)
	END_STRUCT;
	MpTensionInitOrderGroupType : 	STRUCT  (*Parameters for the initialization group.*)
		NumberOfZones : UINT; (*Number of zones in the initialization group.*)
		Zones : {REDUND_UNREPLICABLE} UDINT; (*List of closed-loop tension controllers that must be initialized. The size of the array is not permitted to be less than the size defined via "NumberOfZones".*)
	END_STRUCT;
END_TYPE

(************ MpTensionController Parameters*)

TYPE
	MpTensionControllerInfoType : 	STRUCT  (*Additional information for the component.*)
		State : MpTensionControlStateEnum; (*Controller state.*)
		InTolerance : BOOL; (*Indicates whether the controlled variable is within the tolerance values.*)
		MaterialBreak : BOOL; (*Indicates a material break.*)
		ProcessedMaterial : REAL; (*Processed material of an unwinder, rewinder or transport axis [m].*)
		Control : MpTensionControlInfoType; (*Information about the closed-loop controller.*)
		DiameterEstimation : MpTensionDiameterInfoType; (*Information about the diameter estimation.*)
		Simulation : MpTensionControllerSimInfoType; (*Information about the simulation.*)
		Diag : MpTensionDiagType; (*Diagnostic structure for the status ID.*)
		TaperTension : MpTensionTaperTensionInfoType; (*Information for rewinder about the taper tension.*)
		SpeedController : MpTensionSpeedControllerInfoType; (*Information about the parameters for the speed controller when using feature "Adjust speed controller".*)
	END_STRUCT;
	MpTensionControlInfoType : 	STRUCT  (*Information about the controller.*)
		AxisVelocityCorrection : REAL; (*Axis correction velocity [measurement units/s].*)
		SetAxisVelocity : REAL; (*Axis velocity setpoint [measurement units/s].*)
		SetMotorTorque : REAL; (*Motor torque setpoint for the axis [N m].*)
		PIDParameters : MpTensionControllerPIDParType; (*Currently used PID parameters.*)
	END_STRUCT;
	MpTensionControllerSimInfoType : 	STRUCT  (*Information about the simulation.*)
		Active : BOOL; (*Indicates whether the simulation is active.*)
		ActualAxisPosition : REAL; (*Current axis position [units].*)
		ActualAxisVelocity : REAL; (*Current axis velocity [units/s].*)
		ActualDiameter : REAL; (*Current winder axis diameter [mm].*)
		ActualMaterialTension : REAL; (*Current tension of the material [N].*)
		ActualDancerPosition : REAL; (*Current position of the dancer [mm].*)
		ActualDancerVelocity : REAL; (*Current dancer velocity [mm/s].*)
	END_STRUCT;
	MpTensionDiameterInfoType : 	STRUCT  (*Information about diameter estimation.*)
		Active : BOOL; (*Indicates whether diameter estimation is active.*)
		EstimatedDiameter : REAL; (*Calculated diameter [mm].*)
		AvgMaterialThickness : REAL; (*Average material thickness [µm].*)
		RemainingRunTime : REAL; (*Time remaining until the rest of the material is wound/unwound [s]. This value is calculated for the current line velocity.*)
	END_STRUCT;
	MpTensionTaperTensionInfoType : 	STRUCT  (*Information for rewinder about taper tension.*)
		Active : BOOL; (*Indicates whether "Taper tension" is active.*)
		SetMaterialTension : REAL; (*Setpoint of the tension in the material, which is calculated according to the diameter [N].*)
	END_STRUCT;
	MpTensionSpeedControllerInfoType : 	STRUCT  (*Information about the speed controller parameters.*)
		AdjustmentActive : BOOL; (*Indicates whether the adjustment of the speed controller parameters is active.*)
		ActualProportionalGain : REAL; (*Interpolated proportional gain of the speed controller [As].*)
		ActualIntegrationTime : REAL; (*Interpolated integration time constant of the speed controller [s].*)
	END_STRUCT;
END_TYPE

(************ MpTensionGroup Parameters*)

TYPE
	MpTensionGroupInfoType : 	STRUCT  (*Additional information for the component.*)
		SetLineVelocity : REAL; (*Smoothed velocity setpoint profile for the line [m/min].*)
		MaterialBreak : BOOL; (*Indicates material break.*)
		Simulation : BOOL; (*Indicates whether the simulation is active.*)
		Diag : MpTensionDiagType; (*Diagnostic structure for the status ID.*)
	END_STRUCT;
END_TYPE

(************ MpTension*)

TYPE
	MpTensionInfoType : 	STRUCT  (*Additional information for the component.*)
		Diag : MpTensionDiagType; (*Diagnostic structure for the status ID.*)
	END_STRUCT;
	MpTensionDiagType : 	STRUCT  (*Additional diagnostic information.*)
		StatusID : MpTensionStatusIDType; (*StatusID diagnostic structure.*)
	END_STRUCT;
	MpTensionStatusIDType : 	STRUCT  (*Segmented StatusID output.*)
		ID : MpTensionErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
		Code : UINT; (*Code for the status ID. This error number can be used to search for additional information in the help system*)
	END_STRUCT;
END_TYPE
