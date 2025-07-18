/* Automation Studio generated header file */
/* Do not edit ! */
/* MpTension 5.24.2 */

#ifndef _MPTENSION_
#define _MPTENSION_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpTension_VERSION
#define _MpTension_VERSION 5.24.2
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpTensionControllerFeatureEnum
{	mpTENSION_FEAT_FEED_FORWARD = 0,
	mpTENSION_FEAT_SPEED_CONTROLLER = 1
} MpTensionControllerFeatureEnum;

typedef enum MpTensionMaterialEnum
{	mpTENSION_MATERIAL_WEB = 0,
	mpTENSION_MATERIAL_WIRE = 1,
	mpTENSION_MATERIAL_GRP_SETTINGS = 2
} MpTensionMaterialEnum;

typedef enum MpTensionControlModeEnum
{	mpTENSION_CONTROL_CLOSED_LOOP = 0,
	mpTENSION_CONTROL_OPEN_LOOP = 1
} MpTensionControlModeEnum;

typedef enum MpTensionControlStateEnum
{	mpTENSION_STATE_WAIT = 0,
	mpTENSION_STATE_SYNC_TO_LINE = 1,
	mpTENSION_STATE_INIT_ZONE_CTRL = 2,
	mpTENSION_STATE_IN_OPERATION = 3,
	mpTENSION_STATE_STOP = 4,
	mpTENSION_STATE_ERROR_STOP = 5,
	mpTENSION_STATE_ERROR_CTRL = 6
} MpTensionControlStateEnum;

typedef enum MpTensionControlTypeEnum
{	mpTENSION_CONTROL_TENSION = 0,
	mpTENSION_CONTROL_DANCER = 1,
	mpTENSION_CONTROL_IN_GEAR = 2,
	mpTENSION_CONTROL_MASTER = 3
} MpTensionControlTypeEnum;

typedef enum MpTensionDiameterEstModeEnum
{	mpTENSION_EST_MODE_POSITION = 0,
	mpTENSION_EST_MODE_VELOCITY = 1
} MpTensionDiameterEstModeEnum;

typedef enum MpTensionDriveSimulationEnum
{	mpTENSION_DRIVE_SIM_COMPLETE = 0
} MpTensionDriveSimulationEnum;

typedef enum MpTensionGroupFeatureEnum
{	mpTENSION_FEAT_INIT_ORDER = 0
} MpTensionGroupFeatureEnum;

typedef enum MpTensionInitSequenceEnum
{	mpTENSION_INIT_ORDER_SERIAL = 0,
	mpTENSION_INIT_ORDER_USER = 1
} MpTensionInitSequenceEnum;

typedef enum MpTensionMotionSystemEnum
{	mpTENSION_MAPP_MOTION = 0,
	mpTENSION_USER_DEFINED_MOTION = 1
} MpTensionMotionSystemEnum;

typedef enum MpTensionOrientationEnum
{	mpTENSION_ORIENTATION_UPSTREAM = 0,
	mpTENSION_ORIENTATION_DOWNSTREAM = 1
} MpTensionOrientationEnum;

typedef enum MpTensionSimulationEnum
{	mpTENSION_SIM_NOT_USED = 0,
	mpTENSION_SIM_MATERIAL_DRIVE = 1,
	mpTENSION_SIM_MATERIAL = 2
} MpTensionSimulationEnum;

typedef enum MpTensionTaperTensionEnum
{	mpTENSION_TAPER_LINEAR_TENSION = 0,
	mpTENSION_TAPER_LINEAR_TORQUE = 1
} MpTensionTaperTensionEnum;

typedef enum MpTensionUtilizationTypeEnum
{	mpTENSION_UTILIZATION_UNWIND = 0,
	mpTENSION_UTILIZATION_TRANSPORT = 1,
	mpTENSION_UTILIZATION_REWIND = 2
} MpTensionUtilizationTypeEnum;

typedef enum MpTensionWinderTypeEnum
{	mpTENSION_WINDER_TYPE_CENTER = 0,
	mpTENSION_WINDER_TYPE_SURFACE = 1
} MpTensionWinderTypeEnum;

typedef enum MpTensionWindingEnum
{	mpTENSION_WINDING_FROM_TOP = 0,
	mpTENSION_WINDING_FROM_BOTTOM = 1
} MpTensionWindingEnum;

typedef enum MpTensionPIDAdjustmentEnum
{	mpTENSION_ADJUSTMENT_NOT_USED = 0,
	mpTENSION_ADJUSTMENT_INTERPOLATE = 1
} MpTensionPIDAdjustmentEnum;

typedef enum MpTensionErrorEnum
{	mpTENSION_NO_ERROR = 0,
	mpTENSION_ERR_ACTIVATION = -1064239103,
	mpTENSION_ERR_MPLINK_NULL = -1064239102,
	mpTENSION_ERR_MPLINK_INVALID = -1064239101,
	mpTENSION_ERR_MPLINK_CHANGED = -1064239100,
	mpTENSION_ERR_MPLINK_CORRUPT = -1064239099,
	mpTENSION_ERR_MPLINK_IN_USE = -1064239098,
	mpTENSION_ERR_PAR_NULL = -1064239097,
	mpTENSION_ERR_CONFIG_NULL = -1064239096,
	mpTENSION_ERR_CONFIG_NO_PV = -1064239095,
	mpTENSION_ERR_CONFIG_LOAD = -1064239094,
	mpTENSION_WRN_CONFIG_LOAD = -2137980917,
	mpTENSION_ERR_CONFIG_SAVE = -1064239092,
	mpTENSION_ERR_CONFIG_INVALID = -1064239091,
	mpTENSION_ERR_CONFIG_PAR = -1064035328,
	mpTENSION_ERR_AXIS_ERROR = -1064035327,
	mpTENSION_ERR_COMMAND_INVALID = -1064035326,
	mpTENSION_ERR_CONTROL_ERROR = -1064035325,
	mpTENSION_ERR_LINKED_CTRL_ERROR = -1064035324,
	mpTENSION_ERR_LIBRARY_MISSING = -1064035323,
	mpTENSION_WRN_CONFIG_NOT_SAVED = -2137777146,
	mpTENSION_WRN_INPUT_PAR_INVALID = -2137777145,
	mpTENSION_INF_COMPONENT_DISABLED = 1083448328
} MpTensionErrorEnum;

typedef enum MpTensionAlarmEnum
{	mpTENSION_ALM_PAR_INVALID = 0,
	mpTENSION_ALM_COMMAND_INVALID = 1,
	mpTENSION_ALM_OUTSIDE_TOLERANCE = 2,
	mpTENSION_ALM_MATERIAL_BREAK = 3,
	mpTENSION_ALM_INIT_FAILED = 4,
	mpTENSION_ALM_CONFIG_NOT_SAVED = 5
} MpTensionAlarmEnum;

typedef struct MpTensionVelocityProfileType
{	float Acceleration;
	float Deceleration;
	float StopDeceleration;
	float JerkTime;
} MpTensionVelocityProfileType;

typedef struct MpTensionGearboxType
{	unsigned long Input;
	unsigned long Output;
} MpTensionGearboxType;

typedef struct MpTensionSpeedControllerParType
{	float ProportionalGain;
	float IntegrationTime;
} MpTensionSpeedControllerParType;

typedef struct MpTensionAxisParType
{	float MotorTorqueConstant;
	float Inertia;
	float ViscousFriction;
} MpTensionAxisParType;

typedef struct MpTensionDriveSimulationType
{	enum MpTensionDriveSimulationEnum Mode;
	struct MpTensionSpeedControllerParType SpeedController;
	struct MpTensionAxisParType AxisParameters;
} MpTensionDriveSimulationType;

typedef struct MpTensionMotionSystemType
{	enum MpTensionMotionSystemEnum Type;
	plcstring AxisReference[33];
	struct MpTensionVelocityProfileType AxisVelocityProfile;
	struct MpTensionGearboxType Gearbox;
	struct MpTensionDriveSimulationType DriveSimulation;
} MpTensionMotionSystemType;

typedef struct MpTensionWinderType
{	enum MpTensionWinderTypeEnum Type;
	float Width;
	float Diameter;
	float MinimumDiameter;
	float MaximumDiameter;
	enum MpTensionWindingEnum Winding;
} MpTensionWinderType;

typedef struct MpTensionDiameterEstimationType
{	enum MpTensionDiameterEstModeEnum Mode;
	float EstimationWindow;
	float FilterTime;
} MpTensionDiameterEstimationType;

typedef struct MpTensionTaperTensionType
{	plcbit Enable;
	float StartDiameter;
	float MinimumMaterialTension;
	float MaximumMaterialTension;
	enum MpTensionTaperTensionEnum Mode;
} MpTensionTaperTensionType;

typedef struct MpTensionUtilizationType
{	enum MpTensionUtilizationTypeEnum Type;
	float Diameter;
	struct MpTensionWinderType Winder;
	struct MpTensionDiameterEstimationType DiameterEstimation;
	struct MpTensionTaperTensionType TaperTension;
} MpTensionUtilizationType;

typedef struct MpTensionControllerPIDParType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
	float LineVelocity;
} MpTensionControllerPIDParType;

typedef struct MpTensionControlParameterSetType
{	enum MpTensionPIDAdjustmentEnum Adjustment;
	unsigned char UsedOperatingPoint;
	struct MpTensionControllerPIDParType OperatingPoint1;
	struct MpTensionControllerPIDParType OperatingPoint2;
	struct MpTensionControllerPIDParType OperatingPoint3;
	struct MpTensionControllerPIDParType OperatingPoint4;
	struct MpTensionControllerPIDParType OperatingPoint5;
	struct MpTensionControllerPIDParType OperatingPoint6;
	struct MpTensionControllerPIDParType OperatingPoint7;
	struct MpTensionControllerPIDParType OperatingPoint8;
	struct MpTensionControllerPIDParType OperatingPoint9;
	struct MpTensionControllerPIDParType OperatingPoint10;
} MpTensionControlParameterSetType;

typedef struct MpTensionDancerSimulationType
{	float DancerMass;
	float DancerDamping;
	float MinimumDancerPosition;
	float MaximumDancerPosition;
} MpTensionDancerSimulationType;

typedef struct MpTensionToleranceBandType
{	float Lower;
	float Upper;
} MpTensionToleranceBandType;

typedef struct MpTensionInitializationType
{	plcbit Enable;
	float MaximumLineVelocityCorrection;
	float SettlingTime;
	float TimeOut;
} MpTensionInitializationType;

typedef struct MpTensionControlSystemType
{	enum MpTensionControlTypeEnum Type;
	enum MpTensionControlModeEnum Mode;
	struct MpTensionControlParameterSetType PIDParameters;
	float MaximumVelocityCorrection;
	float VelocityOffset;
	struct MpTensionDancerSimulationType DancerSimulation;
	enum MpTensionOrientationEnum Orientation;
	struct MpTensionToleranceBandType ToleranceBand;
	struct MpTensionInitializationType Initialization;
} MpTensionControlSystemType;

typedef struct MpTensionControllerMaterialType
{	enum MpTensionMaterialEnum Type;
	float Length;
	float Thickness;
	float Width;
	float Diameter;
	float YoungsModulus;
	float TensionLimit;
} MpTensionControllerMaterialType;

typedef struct MpTensionControllerInSignalType
{	plcstring LineVelocity[256];
	plcstring ActualAxisPosition[256];
	plcstring ActualAxisVelocity[256];
	plcstring ActualLinePosition[256];
	plcstring ActualLineVelocity[256];
	plcstring SetMaterialTension[256];
	plcstring ActualMaterialTension[256];
	plcstring SetDancerPosition[256];
	plcstring ActualDancerPosition[256];
	plcstring ActualDancerForce[256];
	plcstring AdditiveTorque[256];
	plcstring AdditiveForce[256];
	plcstring ActualDiameter[256];
	plcstring PowerOn[256];
	plcstring IsHomed[256];
} MpTensionControllerInSignalType;

typedef struct MpTensionControllerOutSignalType
{	plcstring SetAxisVelocity[256];
	plcstring SetMotorTorque[256];
	plcstring Power[256];
	plcstring Home[256];
} MpTensionControllerOutSignalType;

typedef struct MpTensionControllerFeatureType
{	plcstring FeatureReference1[33];
	plcstring FeatureReference2[33];
} MpTensionControllerFeatureType;

typedef struct MpTensionControllerConfigType
{	struct MpTensionMotionSystemType MotionSystem;
	struct MpTensionUtilizationType Utilization;
	struct MpTensionControlSystemType Controller;
	struct MpTensionControllerMaterialType Material;
	struct MpTensionControllerInSignalType InputSignals;
	struct MpTensionControllerOutSignalType OutputSignals;
	struct MpTensionControllerFeatureType Features;
} MpTensionControllerConfigType;

typedef struct MpTensionFeedForwardFeatureType
{	float MinimumInertia;
	float MinimumTorque;
	float TestDiameter;
	float TestInertia;
	float MaximumTorque;
} MpTensionFeedForwardFeatureType;

typedef struct MpTensionAdjustSpeedFeatureType
{	float MinimumProportionalGain;
	float MinimumIntegrationTime;
	float TestDiameter;
	float TestProportionalGain;
	float TestIntegrationTime;
} MpTensionAdjustSpeedFeatureType;

typedef struct MpTensionCtrlFeatureConfigType
{	enum MpTensionControllerFeatureEnum Type;
	struct MpTensionFeedForwardFeatureType FeedForward;
	struct MpTensionAdjustSpeedFeatureType AdjustSpeedController;
} MpTensionCtrlFeatureConfigType;

typedef struct MpTensionGroupMaterialType
{	enum MpTensionMaterialEnum Type;
	float Thickness;
	float Width;
	float Diameter;
	float YoungsModulus;
	float TensionLimit;
} MpTensionGroupMaterialType;

typedef struct MpTensionCommonZoneSettingsType
{	struct MpTensionGroupMaterialType Material;
} MpTensionCommonZoneSettingsType;

typedef struct MpTensionGroupInSignalType
{	plcstring GroupLineVelocity[256];
} MpTensionGroupInSignalType;

typedef struct MpTensionGroupFeatureType
{	plcstring FeatureReference1[33];
} MpTensionGroupFeatureType;

typedef struct MpTensionGroupConfigType
{	enum MpTensionSimulationEnum Simulation;
	struct MpTensionVelocityProfileType LineVelocityProfile;
	struct MpTensionCommonZoneSettingsType CommonZoneSettings;
	struct MpTensionGroupInSignalType InputSignals;
	struct MpTensionGroupFeatureType Features;
} MpTensionGroupConfigType;

typedef struct MpTensionInitOrderFeatureType
{	enum MpTensionInitSequenceEnum Mode;
	unsigned short NumberOfGroups;
	unsigned long Groups;
} MpTensionInitOrderFeatureType;

typedef struct MpTensionGroupFeatureConfigType
{	enum MpTensionGroupFeatureEnum Type;
	struct MpTensionInitOrderFeatureType InitializationOrder;
} MpTensionGroupFeatureConfigType;

typedef struct MpTensionInitOrderGroupType
{	unsigned short NumberOfZones;
	unsigned long Zones;
} MpTensionInitOrderGroupType;

typedef struct MpTensionControlInfoType
{	float AxisVelocityCorrection;
	float SetAxisVelocity;
	float SetMotorTorque;
	struct MpTensionControllerPIDParType PIDParameters;
} MpTensionControlInfoType;

typedef struct MpTensionDiameterInfoType
{	plcbit Active;
	float EstimatedDiameter;
	float AvgMaterialThickness;
	float RemainingRunTime;
} MpTensionDiameterInfoType;

typedef struct MpTensionControllerSimInfoType
{	plcbit Active;
	float ActualAxisPosition;
	float ActualAxisVelocity;
	float ActualDiameter;
	float ActualMaterialTension;
	float ActualDancerPosition;
	float ActualDancerVelocity;
} MpTensionControllerSimInfoType;

typedef struct MpTensionStatusIDType
{	enum MpTensionErrorEnum ID;
	MpComSeveritiesEnum Severity;
	unsigned short Code;
} MpTensionStatusIDType;

typedef struct MpTensionDiagType
{	struct MpTensionStatusIDType StatusID;
} MpTensionDiagType;

typedef struct MpTensionTaperTensionInfoType
{	plcbit Active;
	float SetMaterialTension;
} MpTensionTaperTensionInfoType;

typedef struct MpTensionSpeedControllerInfoType
{	plcbit AdjustmentActive;
	float ActualProportionalGain;
	float ActualIntegrationTime;
} MpTensionSpeedControllerInfoType;

typedef struct MpTensionControllerInfoType
{	enum MpTensionControlStateEnum State;
	plcbit InTolerance;
	plcbit MaterialBreak;
	float ProcessedMaterial;
	struct MpTensionControlInfoType Control;
	struct MpTensionDiameterInfoType DiameterEstimation;
	struct MpTensionControllerSimInfoType Simulation;
	struct MpTensionDiagType Diag;
	struct MpTensionTaperTensionInfoType TaperTension;
	struct MpTensionSpeedControllerInfoType SpeedController;
} MpTensionControllerInfoType;

typedef struct MpTensionGroupInfoType
{	float SetLineVelocity;
	plcbit MaterialBreak;
	plcbit Simulation;
	struct MpTensionDiagType Diag;
} MpTensionGroupInfoType;

typedef struct MpTensionInfoType
{	struct MpTensionDiagType Diag;
} MpTensionInfoType;

typedef struct MpTensionController
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	float PresetDiameter;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionControllerInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Power;
	plcbit Home;
	plcbit MoveVelocity;
	plcbit Control;
	plcbit Desynchronize;
	plcbit HoldControl;
	plcbit SetPresetDiameter;
	plcbit UseDiameterMeasurement;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit InLineVelocity;
	plcbit ControlBusy;
	plcbit ControlActive;
	plcbit PresetDiameterSet;
} MpTensionController_typ;

typedef struct MpTensionControllerConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTensionControllerConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTensionControllerConfig_typ;

typedef struct MpTensionControllerFeatureConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTensionCtrlFeatureConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTensionControllerFeatureConfig_typ;

typedef struct MpTensionGroup
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionGroupInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Power;
	plcbit Home;
	plcbit MoveVelocity;
	plcbit Control;
	plcbit StopLine;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit InLineVelocity;
	plcbit ControlBusy;
	plcbit ControlActive;
	plcbit LineStopped;
} MpTensionGroup_typ;

typedef struct MpTensionGroupConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTensionGroupConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTensionGroupConfig_typ;

typedef struct MpTensionGroupFeatureConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTensionGroupFeatureConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTensionInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTensionGroupFeatureConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpTensionController(struct MpTensionController* inst);
_BUR_PUBLIC void MpTensionControllerConfig(struct MpTensionControllerConfig* inst);
_BUR_PUBLIC void MpTensionControllerFeatureConfig(struct MpTensionControllerFeatureConfig* inst);
_BUR_PUBLIC void MpTensionGroup(struct MpTensionGroup* inst);
_BUR_PUBLIC void MpTensionGroupConfig(struct MpTensionGroupConfig* inst);
_BUR_PUBLIC void MpTensionGroupFeatureConfig(struct MpTensionGroupFeatureConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPTENSION_ */

