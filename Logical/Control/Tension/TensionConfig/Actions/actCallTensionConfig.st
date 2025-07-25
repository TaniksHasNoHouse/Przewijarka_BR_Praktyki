
ACTION actCallTensionConfig: 
	
	TensionConfig[0].Configuration := ADR( TensionConfigType[0]);
	TensionConfig[0]();
	
	TensionConfig[1].Configuration := ADR( TensionConfigType[1]);
	TensionConfig[1]();
	
	TensionConfig[2].Configuration := ADR( TensionConfigType[2]);
	TensionConfig[2]();
END_ACTION
