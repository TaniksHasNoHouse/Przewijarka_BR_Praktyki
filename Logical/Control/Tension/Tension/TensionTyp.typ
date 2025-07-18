
TYPE
	TensionTyp : 	STRUCT 
		GroupLineVelocity : REAL;
		TensionController : ARRAY[0..INDEX_NR_OF_ZONES]OF MpTensionController;
		TensionGroup : MpTensionGroup;
	END_STRUCT;
END_TYPE
