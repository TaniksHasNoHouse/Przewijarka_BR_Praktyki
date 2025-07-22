
{REDUND_OK} FUNCTION_BLOCK MTWinderAxisController (*This function block implements feed-forward control for velocity and torque that is dependent on the winder diameter.*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Parameter for configuring the winder.*) (* *) (*#PAR#*)
		Parameters : MTWinderAxisControllerType; (*Parameter for the winder axis.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		SetLineVelocity : REAL; (*Line velocity. Unit: [Units/s]*) (* *) (*#CYC#*)
		ActDiameter : REAL; (*Winder diameter. Unit: [mm]. *) (* *) (*#CYC#*)
		SetMaterialTension : REAL; (*Set value for material tension Unit: [N].*) (* *) (*#CYC#*)
		SynchronizationTime : REAL; (*Synchronization time. Unit: [s]. *) (* *) (*#CMD##OPT#*)
		StartSynchronization : BOOL; (*A rising edge starts a new synchronization of the winder axis (in SynchronizationTime) to the predefined line velocity.*) (* *) (*#CMD##OPT#*)
		StopSynchronization : BOOL; (*A rising edge brakes the movement of the winder axis (in SynchronizationTime).*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*The function block is not yet completed. *) (* *) (*#PAR#*)
		Active : BOOL; (*The function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		SetWinderVelocity : REAL; (*Setpoint for the winder velocity. Unit: [Units/s].*) (* *) (*#CMD##OPT#*)
		SetMotorTorque : REAL; (*Setpoint for the motor torque. Unit: [Nm].*) (* *) (*#CYC#*)
		ActProportionalGain : REAL; (*Interpolated proportional gain of the speed controller. Unit: [As].*) (* *) (*#CYC#*)
		ActIntegrationTime : REAL; (*Interpolated integration time constant of the speed controller. Unit: [s].*) (* *) (*#CYC#*)
		InitSpeedController : BOOL; (*Generates a rising edge when initialization of the speed controller is required.*) (* *) (*#CYC#*)
		ActInertia : REAL; (*Moment of inertia of the winder/unwinder for the current diameter. Unit: [kgm²]. *)
		InSynchronization : BOOL; (*Winder and line velocity synchronized.*) (* *) (*#CYC#*)
	END_VAR
	VAR
		Internal : MTWinderAxisControllerIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTWinderDancerController (*This function block implements a closed-loop controller optimized for dancer control.*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Parameter for configuring the winder.*) (* *) (*#PAR#*)
		Parameters : MTWinderControllerType; (*Parameter for setting the controller.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		SetDancerPosition : REAL; (*Setpoint for the dancer position. Unit: [mm].*) (* *) (*#CYC#*)
		ActDancerPosition : REAL; (*Actual value for the dancer position. Unit: [mm].*) (* *) (*#CYC#*)
		ActDiameter : REAL; (*Current winder diameter. Unit: [mm].*) (* *) (*#CYC#*)
		Hold : BOOL; (*Freezes the function block.*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		VelocityCorrection : REAL; (*Calculated correction velocity for the winder axis. Unit: [Units/s].*) (* *) (*#CYC#*)
		MaterialBreak : BOOL; (*Indicates material failure.*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR
		Internal : MTWinderDancerControllerIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTWinderDiameterEstimator (*This function block implements diameter estimation for winder and unwinder systems.*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Parameter for configuring the winder.*) (* *) (*#PAR#*)
		Parameters : MTWinderDiameterEstType; (*Parameter for diameter estimation.*) (* *) (*#PAR#*)
		Mode : MTWinderDiameterEstModeEnum; (*Diameter estimation mode.*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		ActLinePosition : DINT; (*Measured actual position of the line. Unit: [Units].*)
		ActLineVelocity : REAL; (*Measured actual velocity of the line. Unit: [Units/s].*)
		ActWinderPosition : DINT; (*Measured actual position of the winder axis. Unit: [Units].*)
		ActWinderVelocity : REAL; (*Measured actual velocity of the winder. Unit: [Units/s].*)
		ActDancerPosition : REAL; (*Actual value for the dancer position. Unit: [mm].*)
		PresetDiameter : REAL; (*Preset value for the winder diameter. Unit: [mm]. *)
		SetPresetDiameter : BOOL; (*A rising edge sets ActDiameter = PresetDiameter.*)
		Hold : BOOL; (*Freezes the function block.*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		ActDiameter : REAL; (*Estimated winder diameter. Unit: [mm]. *)
		AvgMaterialThickness : REAL; (*Average material thickness. Unit: [µm]. *)
		AvgMaterialDensity : REAL; (*Average material density. Unit: [kg/m³]. *)
		ProcessedMaterial : REAL; (*Material being processed on the winder. Unit: [m].*)
		RemainingRunTime : REAL; (*Time remaining until the rest of the material is wound/unwound. Unit: [s].*)
		MaterialBreak : BOOL; (*Indicates material failure.*)
	END_VAR
	VAR
		Internal : MTWinderDiameterEstInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTWinderSimulationModel (*This function block implements a simulation model for winder and unwinder systems.*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Parameter for configuring the winder.*) (* *) (*#PAR#*)
		Parameters : MTWinderSimulationModelType; (*Parameter for the simulation model.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		ModelType : MTWinderModelTypeEnum; (*Model for the winder application.*) (* *) (*#PAR#*)
		TorqueMode : MTWinderTorqueModeEnum; (*Specifies how the value of the SetMotorTorque input is used.*) (* *) (*#PAR#*)
		SetLineVelocity : REAL; (*Preset value for the line velocity. Unit: [m/min].*) (* *) (*#CYC#*)
		SetWinderVelocity : REAL; (*Velocity setpoint of the winder. Unit: [Units/s]*) (* *) (*#CYC#*)
		WinderVelocityCorrection : REAL; (*Correction velocity of the winder. Unit: [Units/s]*) (* *) (*#CYC#*)
		SetMotorTorque : REAL; (*Torque for feed-forward control or torque limiting. Unit: [Nm].*) (* *) (*#CYC#*)
		SetDancerTorque : REAL; (*Torque applied to the dancer arm. Unit: [Nm]. *) (* *) (*#CYC#*)
		ActProportionalGain : REAL; (*Proportional gain of the speed controller. Unit: [As].*) (* *) (*#CMD##OPT#*)
		ActIntegrationTime : REAL; (*Integral action time of the speed controller. Unit: [s].*) (* *) (*#CMD##OPT#*)
		InitSpeedController : BOOL; (*The parameters ActProportionalGain and ActIntegrationTime are updated on a rising edge of an input.*) (* *) (*#CMD##OPT#*)
		MaterialBreak : BOOL; (*A rising edge simulates material failure. *) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		ActLinePosition : DINT; (*Actual position of the line. Unit: [Units].*) (* *) (*#CYC#*)
		ActLineVelocity : REAL; (*Actual speed of the line. Unit: [Units/s].*) (* *) (*#CYC#*)
		ActWinderPosition : DINT; (*Actual position of the winder. Unit: [Units].*) (* *) (*#CYC#*)
		ActWinderVelocity : REAL; (*Actual winder velocity. Units: [Units/s].*) (* *) (*#CYC#*)
		ActDancerPosition : REAL; (*Actual position of the dancer. Unit: [mm]. *) (* *) (*#CYC#*)
		ActDiameter : REAL; (*Actual diameter of the winder. Unit: [mm]. *) (* *) (*#CYC#*)
		ActMaterialTension : REAL; (*Actual tension of the material. Unit: [N].*) (* *) (*#CYC#*)
		ActMotorTorque : REAL; (*Actual torque of the winder motor. Unit: [Nm]. *) (* *) (*#CYC#*)
	END_VAR
	VAR
		Internal : MTWinderSimulationModelIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTWinderTaperTension (*This function block generates a tension curve in relation to the diameter. *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Configuration parameters for the winder and the motor.*) (* *) (*#PAR#*)
		Parameters : MTWinderTaperTensionType; (*Parameter for determining the tension profile.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		ActDiameter : REAL; (*Current winder diameter. Unit: [mm].*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*The function block is active. *) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		SetMaterialTension : REAL; (*Setpoint for the tension. Unit: [N]*) (* *) (*#CYC#*)
	END_VAR
	VAR
		Internal : MTWinderTaperTensionInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTWinderTensionController (*This function block implements a closed-loop tension controller.*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#*)
		Configuration : MTWinderConfigurationType; (*Parameter for configuring the winder.*) (* *) (*#PAR#*)
		Parameters : MTWinderControllerType; (*Parameter for setting the controller.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters are updated on a rising edge.*) (* *) (*#PAR#*)
		SetMaterialTension : REAL; (*Setpoint for the tension. Unit: [N]*) (* *) (*#CYC#*)
		ActMaterialTension : REAL; (*Current tension. Unit: [N]*) (* *) (*#CYC#*)
		ActDiameter : REAL; (*Current winder diameter. Unit: [mm].*) (* *) (*#CYC#*)
		Hold : BOOL; (*Freezes the function block.*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update completed.*) (* *) (*#PAR#*)
		VelocityCorrection : REAL; (*Calculated correction velocity for the winder axis. Unit: [units/s]*) (* *) (*#CYC#*)
		MaterialBreak : BOOL; (*Indicates material failure.*) (* *) (*#CMD##OPT#*)
	END_VAR
	VAR
		Internal : MTWinderTensionControllerIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
