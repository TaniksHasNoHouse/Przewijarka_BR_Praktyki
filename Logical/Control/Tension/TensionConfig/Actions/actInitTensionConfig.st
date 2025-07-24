
ACTION actInitTensionConfig: 
	// MpLink
	TensionConfig[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionConfig[1].MpLink := ADR(gTensionCtrl_Master);
	TensionConfig[2].MpLink := ADR(gTensionCtrl_Rewinder);
	
	TensionConfig[0].Enable := TRUE;
	TensionConfig[1].Enable := TRUE;
	TensionConfig[2].Enable := TRUE;
	 
END_ACTION
