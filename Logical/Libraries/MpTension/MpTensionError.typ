
TYPE
    MpTensionErrorEnum : 
        ( (* Error numbers of library MpTension *)
        mpTENSION_NO_ERROR := 0, (* No error *)
        mpTENSION_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpTENSION_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpTENSION_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpTENSION_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpTENSION_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpTENSION_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpTENSION_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpTENSION_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpTENSION_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpTENSION_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpTENSION_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpTENSION_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpTENSION_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpTENSION_ERR_CONFIG_PAR := -1064035328, (* The selected configuration parameters are invalid. [Error: 7168, 0xc0941c00] *)
        mpTENSION_ERR_AXIS_ERROR := -1064035327, (* Axis error. [Error: 7169, 0xc0941c01] *)
        mpTENSION_ERR_COMMAND_INVALID := -1064035326, (* The selected command {2:Command} is invalid. [Error: 7170, 0xc0941c02] *)
        mpTENSION_ERR_CONTROL_ERROR := -1064035325, (* Error during the control process. [Error: 7171, 0xc0941c03] *)
        mpTENSION_ERR_LINKED_CTRL_ERROR := -1064035324, (* Tension controller error at {2:ChildName}. (ErrorCause {1:ErrorNumber}). [Error: 7172, 0xc0941c04] *)
        mpTENSION_ERR_LIBRARY_MISSING := -1064035323, (* Library {2:LibName} is missing at the target. [Error: 7173, 0xc0941c05] *)
        mpTENSION_WRN_CONFIG_NOT_SAVED := -2137777146, (* Some configuration parameters were not saved. [Warning: 7174, 0x80941c06] *)
        mpTENSION_WRN_INPUT_PAR_INVALID := -2137777145, (* Input parameter "{2:InputPar}" was limited. [Warning: 7175, 0x80941c07] *)
        mpTENSION_INF_COMPONENT_DISABLED := 1083448328 (* A linked tension controller {2:Name} has been disabled. [Informational: 7176, 0x40941c08] *)
        );
END_TYPE
