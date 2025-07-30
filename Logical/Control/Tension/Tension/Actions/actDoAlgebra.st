
ACTION actDoAlgebra: 
	ActLeftDancerPosScal :=  brmfloor(((INT_TO_REAL(ActLeftDancerPos) - 4066.0) *(1000.0/135534.0)));
	ActRightDancerPosScal := brmfloor(((INT_TO_REAL(ActRightDancerPos) - 4050.0) *(1000.0/135534.0)));
END_ACTION
