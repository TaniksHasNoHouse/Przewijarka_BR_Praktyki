
FUNCTION_BLOCK MpTensionController (*mapp component to control a single zone of a web handling process.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp (MpLink of an MpTensionController configuration).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Power : BOOL; (*Activate or deactivate the axis.*) (* *) (*#CMD#;*)
		Home : BOOL; (*Command to reference the axes.*) (* *) (*#CMD#;*)
		MoveVelocity : BOOL; (*Command to start the movement of the axis.*) (* *) (*#CMD#;*)
		Control : BOOL; (*Command to build up tension in the system.*) (* *) (*#CMD#;*)
		Desynchronize : BOOL; (*Desynchronizes the axis velocity from the group velocity.*) (* *) (*#CMD#OPT#;*)
		HoldControl : BOOL; (*Freezs the closed loop tension control.*) (* *) (*#CMD#OPT#;*)
		PresetDiameter : REAL; (*Preset value for the winder diameter. Unit: [mm].*) (* *) (*#CMD#OPT#;*)
		SetPresetDiameter : BOOL; (*A rising edge sets ActDiameter = PresetDiameter.*) (* *) (*#CMD#OPT#;*)
		UseDiameterMeasurement : BOOL; (*Use the signal provided in the PV mapping.*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#;*)
		PowerOn : BOOL; (*Axis is powered on.*) (* *) (*#CMD#*)
		IsHomed : BOOL; (*Axis is homed.*) (* *) (*#CMD#*)
		InLineVelocity : BOOL; (*Velocity setpoint is reached.*) (* *) (*#CMD#;*)
		ControlBusy : BOOL; (*Tension control is busy.*) (* *) (*#CMD#;*)
		ControlActive : BOOL; (*Control process is active.*) (* *) (*#CMD#;*)
		PresetDiameterSet : BOOL; (*PresetDiameter set.*) (* *) (*#CMD#OPT#;*)
		Info : MpTensionControllerInfoType; (*Additional information about the component.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTensionControllerConfig (*mapp component to configure a MpTensionController FB.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp (MpLink of an MpTensionController configuration).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTensionControllerConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpTensionInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTensionControllerFeatureConfig (*mapp component to configure a MpTensionController Feature.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTensionCtrlFeatureConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpTensionInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTensionGroup (*mapp component to control all linked components of a tension group.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp (MpLink of an MpTensionGroup configuration).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Power : BOOL; (*Activate or deactivate all the axes.*) (* *) (*#CMD#; *)
		Home : BOOL; (*Command to reference the axes.*) (* *) (*#CMD#;*)
		MoveVelocity : BOOL; (*Command to start the movement of the line.*) (* *) (*#CMD#;*)
		Control : BOOL; (*Command to build up tension in the system.*) (* *) (*#CMD#;*)
		StopLine : BOOL; (*Command to stop the whole line.*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		PowerOn : BOOL; (*All axes are powered on.*) (* *) (*#CMD#*)
		IsHomed : BOOL; (*All axes are homed.*) (* *) (*#CMD#*)
		InLineVelocity : BOOL; (*Line velocity setpoint is reached.*) (* *) (*#CMD#;*)
		ControlBusy : BOOL; (*Tension control is busy.*) (* *) (*#CMD#;*)
		ControlActive : BOOL; (*Control process is active.*) (* *) (*#CMD#*)
		LineStopped : BOOL; (*The line stopped the movement.*) (* *) (*#CMD#*)
		Info : MpTensionGroupInfoType; (*Additional information about the component.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTensionGroupConfig (*mapp component to configure a MpTensionGroup FB.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTensionGroupConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpTensionInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTensionGroupFeatureConfig (*mapp component to configure a MpTensionGroup Feature.*) (*$GROUP=mapp Control,$CAT=WebHandling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpWebHandling.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTensionGroupFeatureConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpTensionInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK
