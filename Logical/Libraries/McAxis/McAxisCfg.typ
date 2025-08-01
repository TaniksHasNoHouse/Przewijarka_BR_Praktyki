TYPE
	McABTEnum :
		( (*Base type selector setting*)
		mcABT_LIN_BD := 0, (*Linear bounded - Linear axis with bounded movement scope*)
		mcABT_LIN := 1, (*Linear - Linear axis*)
		mcABT_LIN_PER := 2, (*Linear periodic - Linear axis with periodic movement scope*)
		mcABT_ROT_BD := 10, (*Rotary bounded - Rotary axis with bounded movement scope*)
		mcABT_ROT := 11, (*Rotary - Rotary axis*)
		mcABT_ROT_PER := 12 (*Rotary periodic - Rotary axis with periodic movement scope*)
		);
	McABTLinBdType : STRUCT (*Type mcABT_LIN_BD settings*)
		MeasurementUnit : McCfgLocLenUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
	END_STRUCT;
	McABTLinType : STRUCT (*Type mcABT_LIN settings*)
		MeasurementUnit : McCfgLocLenUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
	END_STRUCT;
	McABTLinPerPerSetType : STRUCT (*Possible position value range of a periodic axis*)
		Period : LREAL; (*The value range for axis positions is [0 , Period[ [Measurement units]*)
	END_STRUCT;
	McABTLinPerType : STRUCT (*Type mcABT_LIN_PER settings*)
		MeasurementUnit : McCfgLocLenUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
		PeriodSettings : McABTLinPerPerSetType; (*Possible position value range of a periodic axis*)
	END_STRUCT;
	McABTRotBdType : STRUCT (*Type mcABT_ROT_BD settings*)
		MeasurementUnit : McCfgLocRotUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
	END_STRUCT;
	McABTRotType : STRUCT (*Type mcABT_ROT settings*)
		MeasurementUnit : McCfgLocRotUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
	END_STRUCT;
	McABTRotPerPerSetType : STRUCT (*Possible position value range of a periodic axis*)
		Period : LREAL; (*The value range for axis positions is [0 , Period[ [Measurement units]*)
	END_STRUCT;
	McABTRotPerType : STRUCT (*Type mcABT_ROT_PER settings*)
		MeasurementUnit : McCfgLocRotUnitEnum; (*Measurement unit for the axis*)
		MeasurementResolution : LREAL; (*Possible resolution of measurement unit that can be achieved [Measurement units]*)
		CountDirection : McCfgCntDirEnum; (*Direction of the axis in which the position value is increasing*)
		PeriodSettings : McABTRotPerPerSetType; (*Possible position value range of a periodic axis*)
	END_STRUCT;
	McABTType : STRUCT (*Defines the basic movement possibilities of the axis*)
		Type : McABTEnum; (*Base type selector setting*)
		LinearBounded : McABTLinBdType; (*Type mcABT_LIN_BD settings*)
		Linear : McABTLinType; (*Type mcABT_LIN settings*)
		LinearPeriodic : McABTLinPerType; (*Type mcABT_LIN_PER settings*)
		RotaryBounded : McABTRotBdType; (*Type mcABT_ROT_BD settings*)
		Rotary : McABTRotType; (*Type mcABT_ROT settings*)
		RotaryPeriodic : McABTRotPerType; (*Type mcABT_ROT_PER settings*)
	END_STRUCT;
	McAMLEnum :
		( (*Movement limits selector setting*)
		mcAML_INT := 0, (*Internal - Internal definition of limits*)
		mcAML_INT_PATH_AX := 1, (*Internal path axis - Internal definition of limits with additional settings for a path controlled axis*)
		mcAML_EXT := 2 (*External - External definition of limits*)
		);
	McAMoveLimVelEnum :
		( (*Velocity selector setting*)
		mcAMLV_BASIC := 0, (*Basic -*)
		mcAMLV_ADV := 1 (*Advanced -*)
		);
	McAMoveLimVelType : STRUCT (*Limits for the velocity of the axis*)
		Type : McAMoveLimVelEnum; (*Velocity selector setting*)
		Basic : McCfgLimVelBaseType; (*Type mcAMLV_BASIC settings*)
		Advanced : McCfgLimVelAdvType; (*Type mcAMLV_ADV settings*)
	END_STRUCT;
	McAMoveLimAccEnum :
		( (*Acceleration selector setting*)
		mcAMLA_BASIC := 0, (*Basic -*)
		mcAMLA_ADV := 1 (*Advanced -*)
		);
	McAMoveLimAccType : STRUCT (*Limits for the acceleration of the axis*)
		Type : McAMoveLimAccEnum; (*Acceleration selector setting*)
		Basic : McCfgLimAccBaseType; (*Type mcAMLA_BASIC settings*)
		Advanced : McCfgLimAccAdvType; (*Type mcAMLA_ADV settings*)
	END_STRUCT;
	McAMoveLimDecEnum :
		( (*Deceleration selector setting*)
		mcAMLD_BASIC := 0, (*Basic -*)
		mcAMLD_ADV := 1 (*Advanced -*)
		);
	McAMoveLimDecType : STRUCT (*Limits for the deceleration of the axis*)
		Type : McAMoveLimDecEnum; (*Deceleration selector setting*)
		Basic : McCfgLimDecBaseType; (*Type mcAMLD_BASIC settings*)
		Advanced : McCfgLimDecAdvType; (*Type mcAMLD_ADV settings*)
	END_STRUCT;
	McAMLIntType : STRUCT (*Type mcAML_INT settings*)
		Position : McCfgLimPosType; (*Movement range of the axis via two position boundaries*)
		Velocity : McAMoveLimVelType; (*Limits for the velocity of the axis*)
		Acceleration : McAMoveLimAccType; (*Limits for the acceleration of the axis*)
		Deceleration : McAMoveLimDecType; (*Limits for the deceleration of the axis*)
	END_STRUCT;
	McAMLIntPathAxType : STRUCT (*Type mcAML_INT_PATH_AX settings*)
		Position : McCfgLimPosType; (*Movement range of the axis via two position boundaries*)
		Velocity : McAMoveLimVelType; (*Limits for the velocity of the axis*)
		Acceleration : McAMoveLimAccType; (*Limits for the acceleration of the axis*)
		Deceleration : McAMoveLimDecType; (*Limits for the deceleration of the axis*)
		Jerk : McCfgLimJerkType; (*Jerk limits*)
		Torque : McCfgLimTorqType; (*Torque limits*)
		Force : McCfgLimForType; (*Limits for the force of the axis*)
	END_STRUCT;
	McAMLType : STRUCT (*Various limit values that will be considered for axis movements*)
		Type : McAMLEnum; (*Movement limits selector setting*)
		Internal : McAMLIntType; (*Type mcAML_INT settings*)
		InternalPathAxis : McAMLIntPathAxType; (*Type mcAML_INT_PATH_AX settings*)
		External : McCfgExtLimRefType; (*Type mcAML_EXT settings*)
	END_STRUCT;
	McCfgAxType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX*)
		BaseType : McABTType; (*Defines the basic movement possibilities of the axis*)
		MovementLimits : McAMLType; (*Various limit values that will be considered for axis movements*)
	END_STRUCT;
	McCfgAxBaseTypType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_BASE_TYP*)
		BaseType : McABTType; (*Defines the basic movement possibilities of the axis*)
	END_STRUCT;
	McCfgAxMoveLimType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_MOVE_LIM*)
		MovementLimits : McAMLType; (*Various limit values that will be considered for axis movements*)
	END_STRUCT;
	McAFPGJFEnum :
		( (*Jerk filter selector setting*)
		mcAFPGJF_NOT_USE := 0, (*Not used - No jerk filter is applied*)
		mcAFPGJF_USE := 1, (*Used - Jerk filter is applied*)
		mcAFPGJF_JERK_LIM := 2 (*Jerk limited - Jerk is considered in the profile generator*)
		);
	McAFPGJFUseType : STRUCT (*Type mcAFPGJF_USE settings*)
		MaximumJerkTime : REAL; (*Maximum configurable jerk filter time [s]*)
		JerkTime : REAL; (*Used jerk filter time ('Jerk time' <= 'Maximum jerk time') [s]*)
	END_STRUCT;
	McAFPGJFJerkLimType : STRUCT (*Type mcAFPGJF_JERK_LIM settings*)
		JerkLimit : REAL; (*Jerk limit in any movement direction [Measurement units/s³]*)
	END_STRUCT;
	McAFPGJFType : STRUCT (*Jerk filter*)
		Type : McAFPGJFEnum; (*Jerk filter selector setting*)
		Used : McAFPGJFUseType; (*Type mcAFPGJF_USE settings*)
		JerkLimited : McAFPGJFJerkLimType; (*Type mcAFPGJF_JERK_LIM settings*)
	END_STRUCT;
	McAFPGZVFEnum :
		( (*Zero vibration filter selector setting*)
		mcAFPGZVF_NOT_USE := 0, (*Not used - No zero vibration filter is applied*)
		mcAFPGZVF_USE := 1 (*Used - Zero vibration filter is applied*)
		);
	McAFPGZVFUseType : STRUCT (*Type mcAFPGZVF_USE settings*)
		MaximumZeroVibrationFilterTime : REAL; (*Maximum configurable zero vibration filter time [s]*)
		ZeroVibrationFilterCoefficient : REAL; (*Zero vibration filter coefficient*)
		ZeroVibrationFilterTime : REAL; (*Zero vibration filter time ('Zero vibration filter time' <= 'Maximum zero vibration filter time') [s]*)
	END_STRUCT;
	McAFPGZVFType : STRUCT (*Zero vibration filter*)
		Type : McAFPGZVFEnum; (*Zero vibration filter selector setting*)
		Used : McAFPGZVFUseType; (*Type mcAFPGZVF_USE settings*)
	END_STRUCT;
	McAFPGCSMaSetValSrcEnum :
		( (*Master set value source selector setting*)
		mcAFPGCSMSVS_PROF_GEN_SET_POS := 0, (*Profile generator set position - Value of profile generator of master is used*)
		mcAFPGCSMSVS_ACP_SET_POS := 1 (*ACOPOS set position - SGEN_S_SET of ACOPOS master is used*)
		);
	McAFPGCSMaSetValSrcType : STRUCT (*Used position value in case a slave axis is coupled to the set position value of this master axis.*)
		Type : McAFPGCSMaSetValSrcEnum; (*Master set value source selector setting*)
	END_STRUCT;
	McAFPGCSType : STRUCT (*Advanced settings for coupling to a master axis to which this axis feature is applied.*)
		MasterSetValueSource : McAFPGCSMaSetValSrcType; (*Used position value in case a slave axis is coupled to the set position value of this master axis.*)
	END_STRUCT;
	McCfgAxFeatProfGenType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_PROF_GEN*)
		JerkFilter : McAFPGJFType; (*Jerk filter*)
		ZeroVibrationFilter : McAFPGZVFType; (*Zero vibration filter*)
		CouplingSettings : McAFPGCSType; (*Advanced settings for coupling to a master axis to which this axis feature is applied.*)
	END_STRUCT;
	McCfgAxFeatPgJerkFltrType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_PG_JERK_FLTR*)
		JerkFilter : McAFPGJFType; (*Jerk filter*)
	END_STRUCT;
	McCfgAxFeatPgZeroVibFltrType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_PG_ZERO_VIB_FLTR*)
		ZeroVibrationFilter : McAFPGZVFType; (*Zero vibration filter*)
	END_STRUCT;
	McCfgAxFeatPgCplgSetType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_PG_CPLG_SET*)
		CouplingSettings : McAFPGCSType; (*Advanced settings for coupling to a master axis to which this axis feature is applied.*)
	END_STRUCT;
	McAFDCSTypEnum :
		( (*Digital cam switch type selector setting*)
		mcAFDCST_ACP := 0 (*ACOPOS - ACOPOS specific part is used*)
		);
	McAFDCSTypAcpValSrcRTOAEnum :
		( (*Reference to other axis selector setting*)
		mcAFDCSTAVSRTOA_NOT_USE := 0, (*Not used -*)
		mcAFDCSTAVSRTOA_USE := 1 (*Used -*)
		);
	McAFDCSTypAcpValSrcRTOAUseType : STRUCT (*Type mcAFDCSTAVSRTOA_USE settings*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
	END_STRUCT;
	McAFDCSTypAcpValSrcRTOAType : STRUCT (*Another axis then the output axis is used as value source*)
		Type : McAFDCSTypAcpValSrcRTOAEnum; (*Reference to other axis selector setting*)
		Used : McAFDCSTypAcpValSrcRTOAUseType; (*Type mcAFDCSTAVSRTOA_USE settings*)
	END_STRUCT;
	McAFDCSTypAcpValSrcParIDEnum :
		( (*ParID selector setting*)
		mcAFDCSTAVSP_NOT_USE := 1, (*Not used - Not used*)
		mcAFDCSTAVSP_USE := 2 (*Used - ParID used*)
		);
	McAFDCSTypAcpValSrcParIDUseType : STRUCT (*Type mcAFDCSTAVSP_USE settings*)
		ParID : UINT; (*ParID which is used as value source*)
	END_STRUCT;
	McAFDCSTypAcpValSrcParIDType : STRUCT (*ParID used as Value source*)
		Type : McAFDCSTypAcpValSrcParIDEnum; (*ParID selector setting*)
		Used : McAFDCSTypAcpValSrcParIDUseType; (*Type mcAFDCSTAVSP_USE settings*)
	END_STRUCT;
	McAFDCSTypAcpValSrcType : STRUCT (*Value source for generating the cam switches*)
		ReferenceToOtherAxis : McAFDCSTypAcpValSrcRTOAType; (*Another axis then the output axis is used as value source*)
		ParID : McAFDCSTypAcpValSrcParIDType; (*ParID used as Value source*)
	END_STRUCT;
	McAFDCSTypAcpOutEnum :
		( (*Output selector setting*)
		mcAFDCSTAO_ACP_HW := 0, (*ACOPOS hardware - ACOPOS hardware is used*)
		mcAFDCSTAO_ACP_PARID := 1 (*ACOPOS ParID - A destination ParID on an ACOPOS axis is used*)
		);
	McAFDCSTypAcpOutAcpHwProdFamEnum :
		( (*ACOPOS product family selector setting*)
		mcAFDCSTAOAHPF_ACP := 0, (*ACOPOS -*)
		mcAFDCSTAOAHPF_ACPM := 1, (*ACOPOSmulti -*)
		mcAFDCSTAOAHPF_ACP_P3 := 2 (*ACOPOS P3 -*)
		);
	McAFDCSACOPOSDigOutEnum :
		( (*Digital output selector setting*)
		mcAFDCSACOPOSDO_SS2X111 := 0, (*SS2.X11.1 -*)
		mcAFDCSACOPOSDO_SS2X112 := 1, (*SS2.X11.2 -*)
		mcAFDCSACOPOSDO_SS2X113 := 2, (*SS2.X11.3 -*)
		mcAFDCSACOPOSDO_SS2X114 := 3, (*SS2.X11.4 -*)
		mcAFDCSACOPOSDO_SS2X115 := 4, (*SS2.X11.5 -*)
		mcAFDCSACOPOSDO_SS2X116 := 5, (*SS2.X11.6 -*)
		mcAFDCSACOPOSDO_SS2X117 := 6, (*SS2.X11.7 -*)
		mcAFDCSACOPOSDO_SS2X118 := 7, (*SS2.X11.8 -*)
		mcAFDCSACOPOSDO_SS2X119 := 8, (*SS2.X11.9 -*)
		mcAFDCSACOPOSDO_SS2X1110 := 9, (*SS2.X11.10 -*)
		mcAFDCSACOPOSDO_SS3X111 := 10, (*SS3.X11.1 -*)
		mcAFDCSACOPOSDO_SS3X112 := 11, (*SS3.X11.2 -*)
		mcAFDCSACOPOSDO_SS3X113 := 12, (*SS3.X11.3 -*)
		mcAFDCSACOPOSDO_SS3X114 := 13, (*SS3.X11.4 -*)
		mcAFDCSACOPOSDO_SS3X115 := 14, (*SS3.X11.5 -*)
		mcAFDCSACOPOSDO_SS3X116 := 15, (*SS3.X11.6 -*)
		mcAFDCSACOPOSDO_SS3X117 := 16, (*SS3.X11.7 -*)
		mcAFDCSACOPOSDO_SS3X118 := 17, (*SS3.X11.8 -*)
		mcAFDCSACOPOSDO_SS3X119 := 18, (*SS3.X11.9 -*)
		mcAFDCSACOPOSDO_SS3X1110 := 19, (*SS3.X11.10 -*)
		mcAFDCSACOPOSDO_SS4X111 := 20, (*SS4.X11.1 -*)
		mcAFDCSACOPOSDO_SS4X112 := 21, (*SS4.X11.2 -*)
		mcAFDCSACOPOSDO_SS4X113 := 22, (*SS4.X11.3 -*)
		mcAFDCSACOPOSDO_SS4X114 := 23, (*SS4.X11.4 -*)
		mcAFDCSACOPOSDO_SS4X115 := 24, (*SS4.X11.5 -*)
		mcAFDCSACOPOSDO_SS4X116 := 25, (*SS4.X11.6 -*)
		mcAFDCSACOPOSDO_SS4X117 := 26, (*SS4.X11.7 -*)
		mcAFDCSACOPOSDO_SS4X118 := 27, (*SS4.X11.8 -*)
		mcAFDCSACOPOSDO_SS4X119 := 28, (*SS4.X11.9 -*)
		mcAFDCSACOPOSDO_SS4X1110 := 29 (*SS4.X11.10 -*)
		);
	McAFDCSACOPOSDigOutType : STRUCT
		Type : McAFDCSACOPOSDigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDCSACOPOSType : STRUCT (*Type mcAFDCSTAOAHPF_ACP settings*)
		DigitalOutput : McAFDCSACOPOSDigOutType;
	END_STRUCT;
	McAFDCSACOPOSmultiDigOutEnum :
		( (*Digital output selector setting*)
		mcAFDCSACOPOSMULTIDO_SS1X111 := 0, (*SS1.X11.1 -*)
		mcAFDCSACOPOSMULTIDO_SS1X113 := 1, (*SS1.X11.3 -*)
		mcAFDCSACOPOSMULTIDO_SS1X115 := 2, (*SS1.X11.5 -*)
		mcAFDCSACOPOSMULTIDO_SS1X116 := 3 (*SS1.X11.6 -*)
		);
	McAFDCSACOPOSmultiDigOutType : STRUCT
		Type : McAFDCSACOPOSmultiDigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDCSACOPOSmultiType : STRUCT (*Type mcAFDCSTAOAHPF_ACPM settings*)
		DigitalOutput : McAFDCSACOPOSmultiDigOutType;
	END_STRUCT;
	McAFDCSACOPOSP3DigOutEnum :
		( (*Digital output selector setting*)
		mcAFDCSACOPOSP3DO_SS1X41E1 := 0, (*SS1.X41E.1 -*)
		mcAFDCSACOPOSP3DO_SS1X41E2 := 1, (*SS1.X41E.2 -*)
		mcAFDCSACOPOSP3DO_SS1X41E3 := 2, (*SS1.X41E.3 -*)
		mcAFDCSACOPOSP3DO_SS1X41E4 := 3, (*SS1.X41E.4 -*)
		mcAFDCSACOPOSP3DO_SS1X41E5 := 4, (*SS1.X41E.5 -*)
		mcAFDCSACOPOSP3DO_SS1X41E6 := 5, (*SS1.X41E.6 -*)
		mcAFDCSACOPOSP3DO_SS1X41E7 := 6, (*SS1.X41E.7 -*)
		mcAFDCSACOPOSP3DO_SS1X41E8 := 7, (*SS1.X41E.8 -*)
		mcAFDCSACOPOSP3DO_SS1X41E9 := 8, (*SS1.X41E.9 -*)
		mcAFDCSACOPOSP3DO_SS1X41E10 := 9 (*SS1.X41E.10 -*)
		);
	McAFDCSACOPOSP3DigOutType : STRUCT
		Type : McAFDCSACOPOSP3DigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDCSACOPOSP3Type : STRUCT (*Type mcAFDCSTAOAHPF_ACP_P3 settings*)
		DigitalOutput : McAFDCSACOPOSP3DigOutType;
	END_STRUCT;
	McAFDCSTypAcpOutAcpHwProdFamType : STRUCT
		Type : McAFDCSTypAcpOutAcpHwProdFamEnum; (*ACOPOS product family selector setting*)
		ACOPOS : McAFDCSACOPOSType; (*Type mcAFDCSTAOAHPF_ACP settings*)
		ACOPOSmulti : McAFDCSACOPOSmultiType; (*Type mcAFDCSTAOAHPF_ACPM settings*)
		ACOPOSP3 : McAFDCSACOPOSP3Type; (*Type mcAFDCSTAOAHPF_ACP_P3 settings*)
	END_STRUCT;
	McAFDCSTypAcpOutAcpHwType : STRUCT (*Type mcAFDCSTAO_ACP_HW settings*)
		ProductFamily : McAFDCSTypAcpOutAcpHwProdFamType;
	END_STRUCT;
	McAFDCSTypAcpOutAcpParIDType : STRUCT (*Type mcAFDCSTAO_ACP_PARID settings*)
		ParID : UINT;
	END_STRUCT;
	McAFDCSTypAcpOutType : STRUCT (*Target of the output value*)
		Type : McAFDCSTypAcpOutEnum; (*Output selector setting*)
		ACOPOSHardware : McAFDCSTypAcpOutAcpHwType; (*Type mcAFDCSTAO_ACP_HW settings*)
		ACOPOSParID : McAFDCSTypAcpOutAcpParIDType; (*Type mcAFDCSTAO_ACP_PARID settings*)
	END_STRUCT;
	McAFDCSTypAcpType : STRUCT (*Type mcAFDCST_ACP settings*)
		ValueSource : McAFDCSTypAcpValSrcType; (*Value source for generating the cam switches*)
		Output : McAFDCSTypAcpOutType; (*Target of the output value*)
	END_STRUCT;
	McAFDCSTypType : STRUCT (*Type of the digital output configuration*)
		Type : McAFDCSTypEnum; (*Digital cam switch type selector setting*)
		ACOPOS : McAFDCSTypAcpType; (*Type mcAFDCST_ACP settings*)
	END_STRUCT;
	McCfgAxFeatDigCamSwType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_DIG_CAM_SW*)
		DigitalCamSwitchType : McAFDCSTypType; (*Type of the digital output configuration*)
	END_STRUCT;
	McAFDOTypEnum :
		( (*Digital output type selector setting*)
		mcAFDOT_ACP := 0, (*ACOPOS - ACOPOS specific part is used*)
		mcAFDOT_STP := 1 (*Stepper - Stepper specific parts are used*)
		);
	McAFDOTypAcpOutEnum :
		( (*Output selector setting*)
		mcAFDOTAO_ACP_HW := 0 (*ACOPOS hardware - ACOPOS hardware is used*)
		);
	McAFDOTypAcpOutAcpHwProdFamEnum :
		( (*ACOPOS product family selector setting*)
		mcAFDOTAOAHPF_ACP := 0, (*ACOPOS -*)
		mcAFDOTAOAHPF_ACPM := 1, (*ACOPOSmulti -*)
		mcAFDOTAOAHPF_ACP_P3 := 2 (*ACOPOS P3 -*)
		);
	McAFDOACOPOSDigOutEnum :
		( (*Digital output selector setting*)
		mcAFDOACOPOSDO_SS2X111 := 0, (*SS2.X11.1 -*)
		mcAFDOACOPOSDO_SS2X112 := 1, (*SS2.X11.2 -*)
		mcAFDOACOPOSDO_SS2X113 := 2, (*SS2.X11.3 -*)
		mcAFDOACOPOSDO_SS2X114 := 3, (*SS2.X11.4 -*)
		mcAFDOACOPOSDO_SS2X115 := 4, (*SS2.X11.5 -*)
		mcAFDOACOPOSDO_SS2X116 := 5, (*SS2.X11.6 -*)
		mcAFDOACOPOSDO_SS2X117 := 6, (*SS2.X11.7 -*)
		mcAFDOACOPOSDO_SS2X118 := 7, (*SS2.X11.8 -*)
		mcAFDOACOPOSDO_SS2X119 := 8, (*SS2.X11.9 -*)
		mcAFDOACOPOSDO_SS2X1110 := 9, (*SS2.X11.10 -*)
		mcAFDOACOPOSDO_SS3X111 := 10, (*SS3.X11.1 -*)
		mcAFDOACOPOSDO_SS3X112 := 11, (*SS3.X11.2 -*)
		mcAFDOACOPOSDO_SS3X113 := 12, (*SS3.X11.3 -*)
		mcAFDOACOPOSDO_SS3X114 := 13, (*SS3.X11.4 -*)
		mcAFDOACOPOSDO_SS3X115 := 14, (*SS3.X11.5 -*)
		mcAFDOACOPOSDO_SS3X116 := 15, (*SS3.X11.6 -*)
		mcAFDOACOPOSDO_SS3X117 := 16, (*SS3.X11.7 -*)
		mcAFDOACOPOSDO_SS3X118 := 17, (*SS3.X11.8 -*)
		mcAFDOACOPOSDO_SS3X119 := 18, (*SS3.X11.9 -*)
		mcAFDOACOPOSDO_SS3X1110 := 19, (*SS3.X11.10 -*)
		mcAFDOACOPOSDO_SS4X111 := 20, (*SS4.X11.1 -*)
		mcAFDOACOPOSDO_SS4X112 := 21, (*SS4.X11.2 -*)
		mcAFDOACOPOSDO_SS4X113 := 22, (*SS4.X11.3 -*)
		mcAFDOACOPOSDO_SS4X114 := 23, (*SS4.X11.4 -*)
		mcAFDOACOPOSDO_SS4X115 := 24, (*SS4.X11.5 -*)
		mcAFDOACOPOSDO_SS4X116 := 25, (*SS4.X11.6 -*)
		mcAFDOACOPOSDO_SS4X117 := 26, (*SS4.X11.7 -*)
		mcAFDOACOPOSDO_SS4X118 := 27, (*SS4.X11.8 -*)
		mcAFDOACOPOSDO_SS4X119 := 28, (*SS4.X11.9 -*)
		mcAFDOACOPOSDO_SS4X1110 := 29 (*SS4.X11.10 -*)
		);
	McAFDOACOPOSDigOutType : STRUCT
		Type : McAFDOACOPOSDigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDOACOPOSType : STRUCT (*Type mcAFDOTAOAHPF_ACP settings*)
		DigitalOutput : McAFDOACOPOSDigOutType;
	END_STRUCT;
	McAFDOACOPOSmultiDigOutEnum :
		( (*Digital output selector setting*)
		mcAFDOACOPOSMULTIDO_SS1X111 := 0, (*SS1.X11.1 -*)
		mcAFDOACOPOSMULTIDO_SS1X113 := 1, (*SS1.X11.3 -*)
		mcAFDOACOPOSMULTIDO_SS1X115 := 2, (*SS1.X11.5 -*)
		mcAFDOACOPOSMULTIDO_SS1X116 := 3 (*SS1.X11.6 -*)
		);
	McAFDOACOPOSmultiDigOutType : STRUCT
		Type : McAFDOACOPOSmultiDigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDOACOPOSmultiType : STRUCT (*Type mcAFDOTAOAHPF_ACPM settings*)
		DigitalOutput : McAFDOACOPOSmultiDigOutType;
	END_STRUCT;
	McAFDOACOPOSP3DigOutEnum :
		( (*Digital output selector setting*)
		mcAFDOACOPOSP3DO_SS1X41E1 := 0, (*SS1.X41E.1 -*)
		mcAFDOACOPOSP3DO_SS1X41E2 := 1, (*SS1.X41E.2 -*)
		mcAFDOACOPOSP3DO_SS1X41E3 := 2, (*SS1.X41E.3 -*)
		mcAFDOACOPOSP3DO_SS1X41E4 := 3, (*SS1.X41E.4 -*)
		mcAFDOACOPOSP3DO_SS1X41E5 := 4, (*SS1.X41E.5 -*)
		mcAFDOACOPOSP3DO_SS1X41E6 := 5, (*SS1.X41E.6 -*)
		mcAFDOACOPOSP3DO_SS1X41E7 := 6, (*SS1.X41E.7 -*)
		mcAFDOACOPOSP3DO_SS1X41E8 := 7, (*SS1.X41E.8 -*)
		mcAFDOACOPOSP3DO_SS1X41E9 := 8, (*SS1.X41E.9 -*)
		mcAFDOACOPOSP3DO_SS1X41E10 := 9 (*SS1.X41E.10 -*)
		);
	McAFDOACOPOSP3DigOutType : STRUCT
		Type : McAFDOACOPOSP3DigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDOACOPOSP3Type : STRUCT (*Type mcAFDOTAOAHPF_ACP_P3 settings*)
		DigitalOutput : McAFDOACOPOSP3DigOutType;
	END_STRUCT;
	McAFDOTypAcpOutAcpHwProdFamType : STRUCT
		Type : McAFDOTypAcpOutAcpHwProdFamEnum; (*ACOPOS product family selector setting*)
		ACOPOS : McAFDOACOPOSType; (*Type mcAFDOTAOAHPF_ACP settings*)
		ACOPOSmulti : McAFDOACOPOSmultiType; (*Type mcAFDOTAOAHPF_ACPM settings*)
		ACOPOSP3 : McAFDOACOPOSP3Type; (*Type mcAFDOTAOAHPF_ACP_P3 settings*)
	END_STRUCT;
	McAFDOTypAcpOutAcpHwType : STRUCT (*Type mcAFDOTAO_ACP_HW settings*)
		ProductFamily : McAFDOTypAcpOutAcpHwProdFamType;
	END_STRUCT;
	McAFDOTypAcpOutType : STRUCT (*Target of the output value*)
		Type : McAFDOTypAcpOutEnum; (*Output selector setting*)
		ACOPOSHardware : McAFDOTypAcpOutAcpHwType; (*Type mcAFDOTAO_ACP_HW settings*)
	END_STRUCT;
	McAFDOTypAcpType : STRUCT (*Type mcAFDOT_ACP settings*)
		Output : McAFDOTypAcpOutType; (*Target of the output value*)
	END_STRUCT;
	McAFDOTypStpOutEnum :
		( (*Output selector setting*)
		mcAFDOTSO_STP_HW := 0 (*Stepper hardware - Stepper hardware is used*)
		);
	McAFDOTypStpOutStpHwProdFamEnum :
		( (*Stepper product family selector setting*)
		mcAFDOTSOSHPF_ACOPOSMICRO := 0 (*ACOPOSmicro -*)
		);
	McAFDOAMDigOutEnum :
		( (*Digital output selector setting*)
		mcAFDOAMDO_X224 := 0 (*X2.24 -*)
		);
	McAFDOAMDigOutType : STRUCT
		Type : McAFDOAMDigOutEnum; (*Digital output selector setting*)
	END_STRUCT;
	McAFDOAMType : STRUCT (*Type mcAFDOTSOSHPF_ACOPOSMICRO settings*)
		DigitalOutput : McAFDOAMDigOutType;
	END_STRUCT;
	McAFDOTypStpOutStpHwProdFamType : STRUCT
		Type : McAFDOTypStpOutStpHwProdFamEnum; (*Stepper product family selector setting*)
		ACOPOSmicro : McAFDOAMType; (*Type mcAFDOTSOSHPF_ACOPOSMICRO settings*)
	END_STRUCT;
	McAFDOTypStpOutStpHwType : STRUCT (*Type mcAFDOTSO_STP_HW settings*)
		ProductFamily : McAFDOTypStpOutStpHwProdFamType;
	END_STRUCT;
	McAFDOTypStpOutType : STRUCT (*Target of the output value*)
		Type : McAFDOTypStpOutEnum; (*Output selector setting*)
		StepperHardware : McAFDOTypStpOutStpHwType; (*Type mcAFDOTSO_STP_HW settings*)
	END_STRUCT;
	McAFDOTypStpType : STRUCT (*Type mcAFDOT_STP settings*)
		Output : McAFDOTypStpOutType; (*Target of the output value*)
	END_STRUCT;
	McAFDOTypType : STRUCT (*Type of the digital output configuration*)
		Type : McAFDOTypEnum; (*Digital output type selector setting*)
		ACOPOS : McAFDOTypAcpType; (*Type mcAFDOT_ACP settings*)
		Stepper : McAFDOTypStpType; (*Type mcAFDOT_STP settings*)
	END_STRUCT;
	McCfgAxFeatDigOutType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_DIG_OUT*)
		DigitalOutputType : McAFDOTypType; (*Type of the digital output configuration*)
	END_STRUCT;
	McAFAVSValSrcEnum :
		( (*Value source 1-8 selector setting*)
		mcAFAVSVS_ACP_PARID := 0 (*ACOPOS ParID - ParID of an ACOPOS drive*)
		);
	McAFAVSValSrcAcpParIDType : STRUCT (*Type mcAFAVSVS_ACP_PARID settings*)
		ParID : UINT; (*ParID which is used as value source*)
	END_STRUCT;
	McAFAVSValSrcType : STRUCT (*Selection of the value source*)
		Type : McAFAVSValSrcEnum; (*Value source 1-8 selector setting*)
		ACOPOSParID : McAFAVSValSrcAcpParIDType; (*Type mcAFAVSVS_ACP_PARID settings*)
	END_STRUCT;
	McCfgAxFeatAltValSrcType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_ALT_VAL_SRC*)
		ValueSource : McCfgUnboundedArrayType; (*Selection of the value source*)
	END_STRUCT;
	McAFBBrkCtrlTypEnum :
		( (*Brake control type selector setting*)
		mcAFBBCT_ACP := 0 (*ACOPOS -*)
		);
	McAFBACPCtrlModEnum :
		( (*Control mode selector setting*)
		mcAFBACPCM_AUT := 0, (*Automatic - Brake is controlled by ACOPOS brake controller*)
		mcAFBACPCM_EXT := 1 (*External - Brake has to be controlled externally*)
		);
	McAFBACPCtrlModExtCmdAcptEnum :
		( (*Power state that allows the brake control to be operated*)
		mcAFBACPCMECA_PWR_OFF := 0, (*Power off - Switching the brake is only allowed if the controller is switched off*)
		mcAFBACPCMECA_ANY := 1 (*Any - Switching the brake is also allowed if the controller is switched on*)
		);
	McAFBACPCtrlModExtType : STRUCT (*Type mcAFBACPCM_EXT settings*)
		CommandAcceptance : McAFBACPCtrlModExtCmdAcptEnum; (*Power state that allows the brake control to be operated*)
	END_STRUCT;
	McAFBACPCtrlModType : STRUCT (*Behaviour of holding brake control*)
		Type : McAFBACPCtrlModEnum; (*Control mode selector setting*)
		External : McAFBACPCtrlModExtType; (*Type mcAFBACPCM_EXT settings*)
	END_STRUCT;
	McAFBACPCtrlMonEnum :
		( (*Control monitoring selector setting*)
		mcAFBACPCM_USE := 0, (*Used -*)
		mcAFBACPCM_NOT_USE := 1 (*Not used -*)
		);
	McAFBACPCtrlMonUseTimeEnum :
		( (*Time selector setting*)
		mcAFBACPCMUT_DEF := 0, (*Default -*)
		mcAFBACPCMUT_USR_DEF := 1 (*User defined -*)
		);
	McAFBACPCtrlMonUseTimeUsrDefType : STRUCT (*Type mcAFBACPCMUT_USR_DEF settings*)
		FilterTime : REAL; (*Filter time of control monitoring [s]*)
	END_STRUCT;
	McAFBACPCtrlMonUseTimeType : STRUCT (*Filter time setting of control monitoring*)
		Type : McAFBACPCtrlMonUseTimeEnum; (*Time selector setting*)
		UserDefined : McAFBACPCtrlMonUseTimeUsrDefType; (*Type mcAFBACPCMUT_USR_DEF settings*)
	END_STRUCT;
	McAFBACPCtrlMonUseType : STRUCT (*Type mcAFBACPCM_USE settings*)
		Time : McAFBACPCtrlMonUseTimeType; (*Filter time setting of control monitoring*)
	END_STRUCT;
	McAFBACPCtrlMonType : STRUCT (*Monitoring of motor brake control*)
		Type : McAFBACPCtrlMonEnum; (*Control monitoring selector setting*)
		Used : McAFBACPCtrlMonUseType; (*Type mcAFBACPCM_USE settings*)
	END_STRUCT;
	McAFBACPMoveMonEnum :
		( (*Movement monitoring selector setting*)
		mcAFBACPMM_USE := 0, (*Used -*)
		mcAFBACPMM_NOT_USE := 1 (*Not used -*)
		);
	McAFBACPBrkTstEnum :
		( (*Brake test selector setting*)
		mcAFBACPBT_NOT_USE := 0, (*Not used -*)
		mcAFBACPBT_AUT := 1 (*Automatic -*)
		);
	McAFBACPBrkTstAutStEvntEnum :
		( (*Triggering event for the start of the brake test*)
		mcAFBACPBTASE_CTRL_ON := 0, (*Controller on*)
		mcAFBACPBTASE_CTRL_OFF := 1, (*Controller off*)
		mcAFBACPBTASE_CTRL_ON_AND_OFF := 2, (*Controller on and off*)
		mcAFBACPBTASE_SAFE_BRK_TEST_ACT := 3 (*Safe brake test active*)
		);
	McAFBACPBrkTstAutType : STRUCT (*Type mcAFBACPBT_AUT settings*)
		StartEvent : McAFBACPBrkTstAutStEvntEnum; (*Triggering event for the start of the brake test*)
		Torque : REAL; (*Brake test torque. When 0.0 rated torque of motor brake is used [Nm]*)
		TorqueSlewRate : REAL; (*Maximum change of the brake test torque [Nm/s]*)
		Duration : REAL; (*Duration with applied testing torque [s]*)
	END_STRUCT;
	McAFBACPBrkTstType : STRUCT (*Apply torque for testing the brake*)
		Type : McAFBACPBrkTstEnum; (*Brake test selector setting*)
		Automatic : McAFBACPBrkTstAutType; (*Type mcAFBACPBT_AUT settings*)
	END_STRUCT;
	McAFBACPMoveMonUseType : STRUCT (*Type mcAFBACPMM_USE settings*)
		PositionErrorLimit : REAL; (*Maximum allowed movement of the motor at closed brake [Motor revolutions]*)
		BrakeTest : McAFBACPBrkTstType; (*Apply torque for testing the brake*)
	END_STRUCT;
	McAFBACPMoveMonType : STRUCT (*Mechanical monitoring of motor brake*)
		Type : McAFBACPMoveMonEnum; (*Movement monitoring selector setting*)
		Used : McAFBACPMoveMonUseType; (*Type mcAFBACPMM_USE settings*)
	END_STRUCT;
	McAFBACPType : STRUCT (*Type mcAFBBCT_ACP settings*)
		ControlMode : McAFBACPCtrlModType; (*Behaviour of holding brake control*)
		ControlMonitoring : McAFBACPCtrlMonType; (*Monitoring of motor brake control*)
		MovementMonitoring : McAFBACPMoveMonType; (*Mechanical monitoring of motor brake*)
	END_STRUCT;
	McAFBBrkCtrlTypType : STRUCT
		Type : McAFBBrkCtrlTypEnum; (*Brake control type selector setting*)
		ACOPOS : McAFBACPType; (*Type mcAFBBCT_ACP settings*)
	END_STRUCT;
	McCfgAxFeatBrkType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_BRK*)
		BrakeControlType : McAFBBrkCtrlTypType;
	END_STRUCT;
	McMDCTypeEnum :
		( (*Mechanical deviation compensation type selector setting*)
		mcMDCT_ACP := 0, (*ACOPOS - ACOPOS mechanical deviation compensation*)
		mcMDCT_STP_OR_GEN_PUR_AX := 1 (*Stepper or General purpose axis - Stepper or General purpose axis mechanical deviation compensation*)
		);
	McMDCACalcEnum :
		( (*Automatic compensation calculation at axis startup*)
		mcMDCAC_NOT_USE := 0, (*Not used - No automatic calculation, has to be commanded by FB*)
		mcMDCAC_USE := 1 (*Used - Automatic calculation, compensation data must be available after all task INIT-SP are finished*)
		);
	McMDCAActiEnum :
		( (*Automatic compensation activation after axis homing*)
		mcMDCAA_NOT_USE := 0, (*Not used - No automatic activation, has to be switched on by FB*)
		mcMDCAA_USE := 1 (*Used - Automatic activation when axis is homed*)
		);
	McMDCModeEnum :
		( (*Mode selector setting*)
		mcMDCM_DIR_DEP_CONST_BCKL := 0, (*Dir Dep Const Bckl - Direction dependent constant backlash*)
		mcMDCM_DIR_DEP_SET_POS := 1, (*Dir Dep Set Pos - Direction dependent set position*)
		mcMDCM_DIR_IND := 2, (*Dir Ind - Direction independent*)
		mcMDCM_DIR_IND_SPD := 3, (*Dir Ind Spd - Direction independent with influence on speed controller*)
		mcMDCM_DIR_IND_W_BCKL := 4 (*Dir Ind W Bckl - Direction independent compensation data and backlash*)
		);
	McMDCPosSrcEnum :
		( (*Position source*)
		mcMDCPS_SET_POS := 0, (*Set position - Set position*)
		mcMDCPS_ACT_POS := 1, (*Actual position - Actual position*)
		mcMDCPS_ENC_POS := 2 (*Encoder position - Encoder position*)
		);
	McMDCStEdgEnum :
		( (*Edge at which compensation is started*)
		mcMDCSE_POS := 0, (*Positive - Positive*)
		mcMDCSE_NEG := 1 (*Negative - Negative*)
		);
	McMDCDirDepConstBcklType : STRUCT (*Type mcMDCM_DIR_DEP_CONST_BCKL settings*)
		Backlash : LREAL; (*Backlash [Measurement units]*)
		PositionSource : McMDCPosSrcEnum; (*Position source*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCCompDatEnum :
		( (*Compensation data positive selector setting*)
		mcMDCCD_DAT_OBJ := 0, (*Data object - Data object*)
		mcMDCCD_F_ON_F_DEV := 1, (*File on file device - File on file device*)
		mcMDCCD_PROC_VAR := 2 (*Process variables - Process variables*)
		);
	McMDCCompDatObjType : STRUCT (*Type mcMDCCD_DAT_OBJ settings*)
		DataObjectName : STRING[12];
	END_STRUCT;
	McMDCCompDatFileType : STRUCT (*Type mcMDCCD_F_ON_F_DEV settings*)
		FileDevice : STRING[250]; (*File device*)
		CSVFileName : STRING[250]; (*Full file name with extention*)
	END_STRUCT;
	McMDCCompDatPVType : STRUCT (*Type mcMDCCD_PROC_VAR settings*)
		DataPoints : STRING[250]; (*Data points*)
		NumberOfDataPoints : STRING[250]; (*Number of data points*)
	END_STRUCT;
	McMDCCompDatType : STRUCT (*Compensation data for movement in positive direction*)
		Type : McMDCCompDatEnum; (*Compensation data positive selector setting*)
		DataObject : McMDCCompDatObjType; (*Type mcMDCCD_DAT_OBJ settings*)
		FileOnFileDevice : McMDCCompDatFileType; (*Type mcMDCCD_F_ON_F_DEV settings*)
		ProcessVariables : McMDCCompDatPVType; (*Type mcMDCCD_PROC_VAR settings*)
	END_STRUCT;
	McMDCDatIntEnum :
		( (*Compensation data is interpreted as periodic*)
		mcMDCDI_NOT_PER := 0, (*Not periodic - Not periodic*)
		mcMDCDI_PER := 1 (*Periodic - Periodic*)
		);
	McMDCDirDepSetPosType : STRUCT (*Type mcMDCM_DIR_DEP_SET_POS settings*)
		CompensationDataPositive : McMDCCompDatType; (*Compensation data for movement in positive direction*)
		CompensationDataNegative : McMDCCompDatType; (*Compensation data for movement in negative direction*)
		PositionSource : McMDCPosSrcEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCDirIndType : STRUCT (*Type mcMDCM_DIR_IND settings*)
		CompensationData : McMDCCompDatType; (*Compensation data for movement*)
		PositionSource : McMDCPosSrcEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
	END_STRUCT;
	McMDCDirIndSpdType : STRUCT (*Type mcMDCM_DIR_IND_SPD settings*)
		CompensationData : McMDCCompDatType; (*Compensation data for movement*)
		PositionSource : McMDCPosSrcEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
		FilterTime : REAL; (*Filter time constant for smoothing the speed correction value [s]*)
	END_STRUCT;
	McMDCDirIndBcklType : STRUCT (*Type mcMDCM_DIR_IND_W_BCKL settings*)
		CompensationDataPositive : McMDCCompDatType; (*Compensation data for movement in positive direction*)
		Backlash : LREAL; (*Backlash [Measurement units]*)
		PositionSource : McMDCPosSrcEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCModeType : STRUCT (*Mode for compensating mechanical deviations*)
		Type : McMDCModeEnum; (*Mode selector setting*)
		DirDepConstBckl : McMDCDirDepConstBcklType; (*Type mcMDCM_DIR_DEP_CONST_BCKL settings*)
		DirDepSetPos : McMDCDirDepSetPosType; (*Type mcMDCM_DIR_DEP_SET_POS settings*)
		DirInd : McMDCDirIndType; (*Type mcMDCM_DIR_IND settings*)
		DirIndSpd : McMDCDirIndSpdType; (*Type mcMDCM_DIR_IND_SPD settings*)
		DirIndWBckl : McMDCDirIndBcklType; (*Type mcMDCM_DIR_IND_W_BCKL settings*)
	END_STRUCT;
	McMDCTypeAcpType : STRUCT (*Type mcMDCT_ACP settings*)
		AutomaticCalculation : McMDCACalcEnum; (*Automatic compensation calculation at axis startup*)
		AutomaticActivation : McMDCAActiEnum; (*Automatic compensation activation after axis homing*)
		MechDevnCompMode : McMDCModeType; (*Mode for compensating mechanical deviations*)
	END_STRUCT;
	McMDCModeStpEnum :
		( (*Mode selector setting*)
		mcMDCMS_DIR_DEP_CONST_BCKL := 0, (*Dir Dep Const Bckl - Direction dependent constant backlash*)
		mcMDCMS_DIR_DEP_SET_POS := 1, (*Dir Dep Set Pos - Direction dependent set position*)
		mcMDCMS_DIR_IND := 2, (*Dir Ind - Direction independent*)
		mcMDCMS_DIR_IND_W_BCKL := 3 (*Dir Ind W Bckl - Direction independent compensation data and backlash*)
		);
	McMDCPosSrcStpEnum :
		( (*Position source*)
		mcMDCPSS_SET_POS := 0 (*Set position - Set position*)
		);
	McMDCDirDepConstBcklStpType : STRUCT (*Type mcMDCMS_DIR_DEP_CONST_BCKL settings*)
		Backlash : LREAL; (*Backlash [Measurement units]*)
		PositionSource : McMDCPosSrcStpEnum; (*Position source*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCDirDepSetPosStpType : STRUCT (*Type mcMDCMS_DIR_DEP_SET_POS settings*)
		CompensationDataPositive : McMDCCompDatType; (*Compensation data for movement in positive direction*)
		CompensationDataNegative : McMDCCompDatType; (*Compensation data for movement in negative direction*)
		PositionSource : McMDCPosSrcStpEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCDirIndStpType : STRUCT (*Type mcMDCMS_DIR_IND settings*)
		CompensationData : McMDCCompDatType; (*Compensation data for movement*)
		PositionSource : McMDCPosSrcStpEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
	END_STRUCT;
	McMDCDirIndBcklStpType : STRUCT (*Type mcMDCMS_DIR_IND_W_BCKL settings*)
		CompensationDataPositive : McMDCCompDatType; (*Compensation data for movement in positive direction*)
		Backlash : LREAL; (*Backlash [Measurement units]*)
		PositionSource : McMDCPosSrcStpEnum; (*Position source*)
		DataInterpretation : McMDCDatIntEnum; (*Compensation data is interpreted as periodic*)
		StartEdge : McMDCStEdgEnum; (*Edge at which compensation is started*)
		Velocity : REAL; (*Velocity for edge change [Measurement units/s]*)
		TimeConstant : REAL; (*Time constant of the exponential function for edge change [s]*)
		NoiseLimit : REAL; (*Noise limit [%]*)
	END_STRUCT;
	McMDCModeStpType : STRUCT (*Mode for compensating mechanical deviations*)
		Type : McMDCModeStpEnum; (*Mode selector setting*)
		DirDepConstBckl : McMDCDirDepConstBcklStpType; (*Type mcMDCMS_DIR_DEP_CONST_BCKL settings*)
		DirDepSetPos : McMDCDirDepSetPosStpType; (*Type mcMDCMS_DIR_DEP_SET_POS settings*)
		DirInd : McMDCDirIndStpType; (*Type mcMDCMS_DIR_IND settings*)
		DirIndWBckl : McMDCDirIndBcklStpType; (*Type mcMDCMS_DIR_IND_W_BCKL settings*)
	END_STRUCT;
	McMDCTypeStpOrGenPurAxType : STRUCT (*Type mcMDCT_STP_OR_GEN_PUR_AX settings*)
		AutomaticCalculation : McMDCACalcEnum; (*Automatic compensation calculation at axis startup*)
		AutomaticActivation : McMDCAActiEnum; (*Automatic compensation activation after axis homing*)
		MechDevnCompModeStp : McMDCModeStpType; (*Mode for compensating mechanical deviations*)
	END_STRUCT;
	McMDCTypeType : STRUCT (*Type of the mechanical deviation compensation*)
		Type : McMDCTypeEnum; (*Mechanical deviation compensation type selector setting*)
		ACOPOS : McMDCTypeAcpType; (*Type mcMDCT_ACP settings*)
		StepperOrGeneralPurposeAxis : McMDCTypeStpOrGenPurAxType; (*Type mcMDCT_STP_OR_GEN_PUR_AX settings*)
	END_STRUCT;
	McCfgAxFeatMechDevCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_MECH_DEV_COMP*)
		MechDevnCompType : McMDCTypeType; (*Type of the mechanical deviation compensation*)
	END_STRUCT;
	McAFANERNetwErrReacEnum :
		( (*Network error reaction selector setting*)
		mcAFANERNER_DEF := 0, (*Default - Configured “Stop reaction / Drive error” is immediately executed after a network failure*)
		mcAFANERNER_DELAYED := 1 (*Delayed - Configured “Stop reaction / Drive error” is delayed by a specified time*)
		);
	McAFANERNetwErrReacDelayedType : STRUCT (*Type mcAFANERNER_DELAYED settings*)
		DelayTime : REAL; (*Delay time of network error reaction [s]*)
	END_STRUCT;
	McAFANERNetwErrReacType : STRUCT (*Reaction in case of a network error*)
		Type : McAFANERNetwErrReacEnum; (*Network error reaction selector setting*)
		Delayed : McAFANERNetwErrReacDelayedType; (*Type mcAFANERNER_DELAYED settings*)
	END_STRUCT;
	McCfgAxFeatAcpNetwErrReacType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_ACP_NETW_ERR_REAC*)
		NetworkErrorReaction : McAFANERNetwErrReacType; (*Reaction in case of a network error*)
	END_STRUCT;
	McCfgAxFeatAcpCycDatProcType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AX_FEAT_ACP_CYC_DAT_PROC*)
		ProcessingTaskClass : McPTCEnum; (*Task class for cyclic data processing*)
	END_STRUCT;
END_TYPE