
ACTION actExitTensionConfig: 
	TensionConfig[0].Enable := FALSE;
	TensionConfig[0]();
	
	TensionConfig[1].Enable := FALSE;
	TensionConfig[1]();
	
	TensionConfig[2].Enable := FALSE;
	TensionConfig[2]();
END_ACTION
