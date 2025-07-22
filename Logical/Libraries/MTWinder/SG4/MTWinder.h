/* Automation Studio generated header file */
/* Do not edit ! */
/* MTWinder 1.00.4 */

#ifndef _MTWINDER_
#define _MTWINDER_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTWinder_VERSION
#define _MTWinder_VERSION 1.00.4
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsBrMath.h"
		#include "MTTypes.h"
#endif
#ifdef _SG4
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsBrMath.h"
		#include "MTTypes.h"
#endif
#ifdef _SGC
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsBrMath.h"
		#include "MTTypes.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define mtWND_WRN_TAPER_TENSION_MODE (-2131748991)
 #define mtWND_WRN_MATERIAL_TENSION_LIMIT (-2131748992)
 #define mtWND_WRN_START_DIAMETER_INVALID (-2131748999)
 #define mtWND_ERR_TAPER_TENSION_MODE (-1058007164)
 #define mtWND_ERR_MATERIAL_TENSION_LIMIT (-1058007165)
 #define mtWND_ERR_START_DIAMETER_INVALID (-1058007171)
 #define mtWND_WRN_SIM_PAR_INVALID (-2131749006)
 #define mtWND_ERR_MODEL_TORQUE_INVALID (-1058007178)
 #define mtWND_ERR_TORQUE_MODE_INVALID (-1058007179)
 #define mtWND_ERR_MODEL_TYPE_INVALID (-1058007180)
 #define mtWND_ERR_SIM_PAR_INVALID (-1058007182)
 #define mtWND_WRN_PRESET_DIAMETER (-2131748990)
 #define mtWND_WRN_MAT_BREAK_THRESHOLD (-2131748995)
 #define mtWND_WRN_MIN_DIAMETER_REACHED (-2131749002)
 #define mtWND_WRN_CYCLIC_EST_WINDOW (-2131749003)
 #define mtWND_WRN_DIAMETER_EST_MODE (-2131749005)
 #define mtWND_ERR_MAT_BREAK_THRESHOLD (-1058007168)
 #define mtWND_ERR_CYCLIC_EST_WINDOW (-1058007175)
 #define mtWND_ERR_DIAMETER_EST_MODE (-1058007177)
 #define mtWND_WRN_LINE_VEL_CORRECTION (-2131748993)
 #define mtWND_WRN_MAX_CONTROL_ERROR_NEG (-2131749004)
 #define mtWND_ERR_LINE_VEL_CORRECTION (-1058007166)
 #define mtWND_ERR_MAX_CONTROL_ERROR_NEG (-1058007176)
 #define mtWND_WRN_SYNC_TIME_NEGATIVE (-2131748996)
 #define mtWND_WRN_INTERPOL_PAR_INVALID (-2131749000)
 #define mtWND_WRN_TORQUE_LIMITS_INVALID (-2131749001)
 #define mtWND_ERR_SET_MAT_TENSION_NEG (-1058007169)
 #define mtWND_ERR_INTERPOL_PAR_INVALID (-1058007172)
 #define mtWND_ERR_TORQUE_LIMITS_INVALID (-1058007173)
 #define mtWND_WRN_ACT_DIAMETER_INVALID (-2131748994)
 #define mtWND_WRN_AXIS_PAR_INVALID (-2131749007)
 #define mtWND_WRN_GEO_PAR_INVALID (-2131749008)
 #define mtWND_ERR_ACT_DIAMETER_INVALID (-1058007167)
 #define mtWND_ERR_MATERIAL_BREAK (-1058007181)
 #define mtWND_ERR_AXIS_PAR_INVALID (-1058007183)
 #define mtWND_ERR_GEO_PAR_INVALID (-1058007184)
#else
 _GLOBAL_CONST signed long mtWND_WRN_TAPER_TENSION_MODE;
 _GLOBAL_CONST signed long mtWND_WRN_MATERIAL_TENSION_LIMIT;
 _GLOBAL_CONST signed long mtWND_WRN_START_DIAMETER_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_TAPER_TENSION_MODE;
 _GLOBAL_CONST signed long mtWND_ERR_MATERIAL_TENSION_LIMIT;
 _GLOBAL_CONST signed long mtWND_ERR_START_DIAMETER_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_SIM_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_MODEL_TORQUE_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_TORQUE_MODE_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_MODEL_TYPE_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_SIM_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_PRESET_DIAMETER;
 _GLOBAL_CONST signed long mtWND_WRN_MAT_BREAK_THRESHOLD;
 _GLOBAL_CONST signed long mtWND_WRN_MIN_DIAMETER_REACHED;
 _GLOBAL_CONST signed long mtWND_WRN_CYCLIC_EST_WINDOW;
 _GLOBAL_CONST signed long mtWND_WRN_DIAMETER_EST_MODE;
 _GLOBAL_CONST signed long mtWND_ERR_MAT_BREAK_THRESHOLD;
 _GLOBAL_CONST signed long mtWND_ERR_CYCLIC_EST_WINDOW;
 _GLOBAL_CONST signed long mtWND_ERR_DIAMETER_EST_MODE;
 _GLOBAL_CONST signed long mtWND_WRN_LINE_VEL_CORRECTION;
 _GLOBAL_CONST signed long mtWND_WRN_MAX_CONTROL_ERROR_NEG;
 _GLOBAL_CONST signed long mtWND_ERR_LINE_VEL_CORRECTION;
 _GLOBAL_CONST signed long mtWND_ERR_MAX_CONTROL_ERROR_NEG;
 _GLOBAL_CONST signed long mtWND_WRN_SYNC_TIME_NEGATIVE;
 _GLOBAL_CONST signed long mtWND_WRN_INTERPOL_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_TORQUE_LIMITS_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_SET_MAT_TENSION_NEG;
 _GLOBAL_CONST signed long mtWND_ERR_INTERPOL_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_TORQUE_LIMITS_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_ACT_DIAMETER_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_AXIS_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_WRN_GEO_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_ACT_DIAMETER_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_MATERIAL_BREAK;
 _GLOBAL_CONST signed long mtWND_ERR_AXIS_PAR_INVALID;
 _GLOBAL_CONST signed long mtWND_ERR_GEO_PAR_INVALID;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum MTWinderAxisControllerSyncEnum
{	mtWND_STATE_STOP = 0,
	mtWND_STATE_RAMP_UP = 1,
	mtWND_STATE_IN_SYNC = 2,
	mtWND_STATE_RAMP_DOWN = 3
} MTWinderAxisControllerSyncEnum;

typedef enum MTWinderDiameterEstModeEnum
{	mtWND_NO_ESTIMATION = 0,
	mtWND_POSITION_BASED = 1,
	mtWND_VELOCITY_INTEGRATION_BASED = 2
} MTWinderDiameterEstModeEnum;

typedef enum MTWinderModelTypeEnum
{	mtWND_DANCER = 0,
	mtWND_TENSION_CLOSED_LOOP = 1,
	mtWND_TENSION_OPEN_LOOP = 2
} MTWinderModelTypeEnum;

typedef enum MTWinderTaperTensionModeEnum
{	mtWND_LINEAR_DECREASE_TENSION = 0,
	mtWND_LINEAR_DECREASE_TORQUE = 1
} MTWinderTaperTensionModeEnum;

typedef enum MTWinderTorqueModeEnum
{	mtWND_TORQUE_LIMIT = 40,
	mtWND_TORQUE_FF = 32
} MTWinderTorqueModeEnum;

typedef enum MTWinderTypeEnum
{	mtWND_REWIND = -1,
	mtWND_UNWIND = 1
} MTWinderTypeEnum;

typedef struct MTWinderGeometryType
{	float WinderWidth;
	float MaterialThickness;
	float MaxDiameter;
	float MinDiameter;
	float MinInertia;
	float TestDiameter;
	float TestInertia;
} MTWinderGeometryType;

typedef struct MTWinderAxisType
{	float LineUnits;
	unsigned long WinderUnits;
	unsigned long RevMotor;
	float GearRatio;
	enum MTWinderTypeEnum WinderType;
	plcbit ReverseWinderDirection;
} MTWinderAxisType;

typedef struct MTWinderConfigurationType
{	struct MTWinderGeometryType Geometry;
	struct MTWinderAxisType Axis;
} MTWinderConfigurationType;

typedef struct MTWinderInterpolationType
{	float MinProportionalGain;
	float TestProportionalGain;
	float MinIntegrationTime;
	float TestIntegrationTime;
} MTWinderInterpolationType;

typedef struct MTWinderAxisControllerType
{	float MinTorque;
	float MaxTorque;
	struct MTWinderInterpolationType Interpolation;
} MTWinderAxisControllerType;

typedef struct MTWinderAxisControllerSyncType
{	enum MTWinderAxisControllerSyncEnum SyncState;
	float SyncLineVelocity;
	float SyncLineVelocityOld;
	float SyncLineAcceleration;
	float alpha;
	float SyncTime;
} MTWinderAxisControllerSyncType;

typedef struct MTWinderAxisControllerIntType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderAxisControllerType Parameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit StartSynchronizationOld;
	plcbit StopSynchronizationOld;
	plcbit EnableOld;
	plcbit Update;
	double WinderRatio;
	float ActualDiameter;
	float ActIntegrationTime;
	float ActProportionalGainOld;
	float ActProportionalGain;
	float ActualInertia;
	float RollerDensity;
	signed long StatusIDUpdate;
	signed long StatusIDCommando;
	signed long StatusIDCyclic;
	plcbit InSynchronizationOld;
	struct MTWinderAxisControllerSyncType SynchronizationParameters;
	float SetLineVelocitySampled;
} MTWinderAxisControllerIntType;

typedef struct MTWinderControllerType
{	struct MTPIDParametersType PIDParameters;
	float MaxLineVelocityCorrection;
	float MaxControlError;
} MTWinderControllerType;

typedef struct MTWinderDancerControllerIntType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderControllerType Parameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	double WinderRatio;
	float ActualDiameter;
	plcbit MaterialBreak;
	float ControlError;
	float ControlErrorOld;
	signed long PIDStatusID;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	float ControllerOutput;
	MTPIDIntegrationEnum HoldIntegration;
	MTPIDIntegrationEnum IntegrationStatus;
	signed long StatusIDUpdate;
} MTWinderDancerControllerIntType;

typedef struct MTWinderDiameterEstBufferParType
{	unsigned char Counter;
	unsigned char Index;
	double ActDiameter[100];
	double WinderRevolution[100];
} MTWinderDiameterEstBufferParType;

typedef struct MTWinderDiameterEstType
{	unsigned long CyclicEstimationWindow;
	unsigned long FilterWindow;
	float MaterialBreakThreshold;
} MTWinderDiameterEstType;

typedef struct MTWinderDiameterEstSysParType
{	signed long ActWinderPositionOld;
	signed long ActWinderPositionDelta;
	double ActWinderRevolution;
	unsigned long ActMotorRevolution[2];
} MTWinderDiameterEstSysParType;

typedef struct MTWinderDiameterEstParType
{	double ActDiameter;
	float ActDiameterOld;
	float ActDiameterCorrect;
	float ActDiameterStart;
	plcbit StartEstimation;
	signed long StartLinePosition;
	signed long StartWinderPosition;
	float StartDancerPosition;
	double LinePositionIntegration;
	double WinderPositionIntegration;
	double ActWinderRevolution[3];
	double WinderRevolution;
	signed long ActLinePositionOld;
} MTWinderDiameterEstParType;

typedef struct MTWinderDiameterEstLQFilterType
{	float LQError;
	double LQOutputFiltered[2];
	float LQOutput[2];
	float LQParameterVector[3];
	plcbit UpdateFilter;
	plcbit ResetFilter;
	plcbit InitFilter;
	unsigned long NumberOfDataVector;
	signed long BVector[2];
	double XVector[2];
} MTWinderDiameterEstLQFilterType;

typedef struct MTWinderDiameterEstInternalType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderDiameterEstType Parameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	enum MTWinderDiameterEstModeEnum Mode;
	plcbit SetPresetDiameterOld;
	float PresetDiameter;
	double WinderRatio;
	float RollerDensity;
	unsigned char SetPresetDiameterMode;
	signed char ReverseWinder;
	plcbit MaterialBreak;
	struct MTWinderDiameterEstSysParType SystemParameters;
	struct MTWinderDiameterEstParType EstimationParameters;
	struct MTWinderDiameterEstBufferParType BufferParameters;
	struct MTWinderDiameterEstLQFilterType LQFilter;
	float ActDiameter;
	float AvgMaterialThickness;
	plcbit MinDiameterAchieved;
	signed long ActLinePosition;
	signed long ActLinePositionOld;
	double FilterWindowTime;
	float RemainingRunTime[3];
	float LineVelocity;
} MTWinderDiameterEstInternalType;

typedef struct MTWinderSimMaterialParType
{	float RollerDensity;
	float ElasticityConstant;
	float Elongation;
	unsigned char Material;
} MTWinderSimMaterialParType;

typedef struct MTWinderSimSystemParType
{	double LinePosition;
	double LineVelocity;
	double IntegratorState;
	double MaterialTension[3];
	double DancerArmPosition[3];
	double DancerArmVelocity[3];
	double WinderRollerPosition[3];
	double WinderRollerVelocity[3];
	double UnwoundMaterialLength[3];
} MTWinderSimSystemParType;

typedef struct MTWinderSimulationModelType
{	float MaterialLength;
	float StartDiameter;
	float MaxDancerPosition;
	float DancerLength;
	float DancerInertia;
	float SpeedTorqueFactor;
	float TorqueConstant;
	plcbit Noise;
} MTWinderSimulationModelType;

typedef struct MTWinderSimulationModelIntType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderSimulationModelType Parameters;
	struct MTWinderSimSystemParType SystemParameters;
	struct MTWinderSimMaterialParType MaterialParameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	float ActualDiameter;
	float InitSpeedControllerOld;
	float ActProportionalGain;
	float ActIntegrationTime;
	plcbit MaterialBreak;
	enum MTWinderModelTypeEnum ModelType;
	enum MTWinderTorqueModeEnum TorqueMode;
	plcbit Update;
	plcbit InhibitUpdate;
} MTWinderSimulationModelIntType;

typedef struct MTWinderTaperTensionType
{	float StartDiameter;
	float MaxMaterialTension;
	float MinMaterialTension;
	enum MTWinderTaperTensionModeEnum Mode;
} MTWinderTaperTensionType;

typedef struct MTWinderTaperTensionInternalType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderTaperTensionType Parameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	float ActualDiameter;
	float StartMotorTorque;
	float MaxMotorTorque;
	float MinMotorTorque;
	float SetMotorTorque;
	signed long StatusIDUpdate;
} MTWinderTaperTensionInternalType;

typedef struct MTWinderTensionControllerIntType
{	float CycleTime;
	struct MTWinderConfigurationType Configuration;
	struct MTWinderControllerType Parameters;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	double WinderRatio;
	float ActualDiameter;
	plcbit MaterialBreak;
	float ControlError;
	float ControlErrorOld;
	signed long PIDStatusID;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	float ControllerOutput;
	MTPIDIntegrationEnum HoldIntegration;
	MTPIDIntegrationEnum IntegrationStatus;
	signed long StatusIDUpdate;
} MTWinderTensionControllerIntType;

typedef struct MTWinderAxisController
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderAxisControllerType Parameters;
	float SetLineVelocity;
	float ActDiameter;
	float SetMaterialTension;
	float SynchronizationTime;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetWinderVelocity;
	float SetMotorTorque;
	float ActProportionalGain;
	float ActIntegrationTime;
	float ActInertia;
	/* VAR (analog) */
	struct MTWinderAxisControllerIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit StartSynchronization;
	plcbit StopSynchronization;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit InitSpeedController;
	plcbit InSynchronization;
} MTWinderAxisController_typ;

typedef struct MTWinderDancerController
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderControllerType Parameters;
	float SetDancerPosition;
	float ActDancerPosition;
	float ActDiameter;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float VelocityCorrection;
	/* VAR (analog) */
	struct MTWinderDancerControllerIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit Hold;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit MaterialBreak;
} MTWinderDancerController_typ;

typedef struct MTWinderDiameterEstimator
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderDiameterEstType Parameters;
	enum MTWinderDiameterEstModeEnum Mode;
	signed long ActLinePosition;
	float ActLineVelocity;
	signed long ActWinderPosition;
	float ActWinderVelocity;
	float ActDancerPosition;
	float PresetDiameter;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float ActDiameter;
	float AvgMaterialThickness;
	float AvgMaterialDensity;
	float ProcessedMaterial;
	float RemainingRunTime;
	/* VAR (analog) */
	struct MTWinderDiameterEstInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit SetPresetDiameter;
	plcbit Hold;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit MaterialBreak;
} MTWinderDiameterEstimator_typ;

typedef struct MTWinderSimulationModel
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderSimulationModelType Parameters;
	enum MTWinderModelTypeEnum ModelType;
	enum MTWinderTorqueModeEnum TorqueMode;
	float SetLineVelocity;
	float SetWinderVelocity;
	float WinderVelocityCorrection;
	float SetMotorTorque;
	float SetDancerTorque;
	float ActProportionalGain;
	float ActIntegrationTime;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	signed long ActLinePosition;
	float ActLineVelocity;
	signed long ActWinderPosition;
	float ActWinderVelocity;
	float ActDancerPosition;
	float ActDiameter;
	float ActMaterialTension;
	float ActMotorTorque;
	/* VAR (analog) */
	struct MTWinderSimulationModelIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit InitSpeedController;
	plcbit MaterialBreak;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTWinderSimulationModel_typ;

typedef struct MTWinderTaperTension
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderTaperTensionType Parameters;
	float ActDiameter;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetMaterialTension;
	/* VAR (analog) */
	struct MTWinderTaperTensionInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTWinderTaperTension_typ;

typedef struct MTWinderTensionController
{
	/* VAR_INPUT (analog) */
	struct MTWinderConfigurationType Configuration;
	struct MTWinderControllerType Parameters;
	float SetMaterialTension;
	float ActMaterialTension;
	float ActDiameter;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float VelocityCorrection;
	/* VAR (analog) */
	struct MTWinderTensionControllerIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit Hold;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit MaterialBreak;
} MTWinderTensionController_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTWinderAxisController(struct MTWinderAxisController* inst);
_BUR_PUBLIC void MTWinderDancerController(struct MTWinderDancerController* inst);
_BUR_PUBLIC void MTWinderDiameterEstimator(struct MTWinderDiameterEstimator* inst);
_BUR_PUBLIC void MTWinderSimulationModel(struct MTWinderSimulationModel* inst);
_BUR_PUBLIC void MTWinderTaperTension(struct MTWinderTaperTension* inst);
_BUR_PUBLIC void MTWinderTensionController(struct MTWinderTensionController* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MTWINDER_ */

