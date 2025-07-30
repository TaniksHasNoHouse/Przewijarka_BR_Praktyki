PROGRAM _INIT
	MpAuditTrail_0.MpLink := ADR(gAuditTrail); 
	MpAuditTrail_0.DeviceName := ADR('DATA'); 
	MpAuditTrail_0.Enable := TRUE;

	MpAuditTrailUI_0.MpLink := ADR(gAuditTrail);
	MpAuditTrailUI_0.UIConnect := ADR(AuditUIConnect);
	MpAuditTrailUI_0.Enable := TRUE;
END_PROGRAM

PROGRAM _CYCLIC
	IF Export THEN
		MpAuditTrail_0.Export := TRUE;
		IF (MpAuditTrail_0.Export) AND (MpAuditTrail_0.CommandDone) THEN
			MpAuditTrail_0.Export := FALSE;
			Export := FALSE;
		END_IF
		
		IF MpAuditTrail_0.ArchiveAvailable THEN
			MpAuditTrail_0.ExportArchive := TRUE;
		ELSE
			MpAuditTrail_0.ExportArchive := FALSE;
		END_IF
	ELSE
		MpAuditTrail_0.Export := FALSE;
	END_IF;
	
	Timer();
	MpAuditTrail_0();
	MpAuditTrailUI_0(); 
END_PROGRAM

PROGRAM _EXIT
	MpAuditTrail_0.Enable := FALSE;
	MpAuditTrailUI_0.Enable := FALSE;
END_PROGRAM