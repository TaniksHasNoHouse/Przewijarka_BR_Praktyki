
ACTION actMplink: 
	// MpLink
	TensionConfig[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionConfig[1].MpLink := ADR(gTensionCtrl_Master);
	TensionConfig[2].MpLink := ADR(gTensionCtrl_Rewinder);
END_ACTION
