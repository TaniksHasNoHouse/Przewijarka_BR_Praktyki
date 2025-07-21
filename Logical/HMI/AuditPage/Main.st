
PROGRAM _INIT
	MpAuditTrail_0.MpLink := ADR(gAuditTrail); 
	MpAuditTrail_0.DeviceName := ADR('USER'); 
	MpAuditTrail_0.Enable := TRUE;

	MpAuditTrailUI_0.MpLink := ADR(gAuditTrail);
	MpAuditTrailUI_0.UIConnect := ADR(AuditUIConnect);
	MpAuditTrailUI_0.Enable := TRUE;
END_PROGRAM

PROGRAM _CYCLIC
	MpAuditTrail_0();
	MpAuditTrailUI_0(); 
END_PROGRAM

PROGRAM _EXIT
	MpAuditTrail_0.Enable := FALSE;
END_PROGRAM

