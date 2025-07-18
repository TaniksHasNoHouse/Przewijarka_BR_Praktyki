
TYPE
    MpTensionAlarmEnum : 
        ( (* Alarms of MpTension Library *)
        mpTENSION_ALM_PAR_INVALID := 0, (* The selected parameters are invalid *)
        mpTENSION_ALM_COMMAND_INVALID := 1, (* The command is invalid *)
        mpTENSION_ALM_OUTSIDE_TOLERANCE := 2, (* The actual process value is outside the tolerance (add. Info: actual value) (add. Info: set value) *)
        mpTENSION_ALM_MATERIAL_BREAK := 3, (* Material break was detected *)
        mpTENSION_ALM_INIT_FAILED := 4, (* The variable to be controlled has not reached a stable operating point in the specified time for "Timeout" *)
        mpTENSION_ALM_CONFIG_NOT_SAVED := 5 (* Some configuration parameters were not saved *)
    );
END_TYPE
