
ACTION actRecipeManage: 

		//Call TableConfiguration Variable
		RecipeControl.TableControl.Config;
	
		// create default recipes in case they don't exist yet on the target
		// recipes are created by using the the MpRecipeXml instance interface
	
		CASE RecipeCreateStep OF
			IDLE:	
			
				IF MpRecepieXml_0.Active = TRUE AND MpRecipeUI_0.Active = TRUE THEN
				
				RecipeCreateStep 			:= CREATE_1;

				END_IF
		
			CREATE_1:	// create the first recipe with default values, file name and a known picture index (Bitmap Group in the HMI) 
				MpRecepieXml_0.ErrorReset 			:= FALSE;
			
				MaterialWindingRecipe.TensionLeft := 0;
				MaterialWindingRecipe.TensionRight := 15;
				MaterialWindingRecipe.Speed := 5;
				MaterialWindingRecipe.Direction := FALSE;
				MaterialWindingRecipe.Motor1PID.P := 0;
				MaterialWindingRecipe.Motor1PID.I := 0;
				MaterialWindingRecipe.Motor2PID.P := 0;
				MaterialWindingRecipe.Motor2PID.I := 0;
				MaterialWindingRecipe.Motor3PID.P := 0;
				MaterialWindingRecipe.Motor3PID.I := 0;
				MaterialWindingRecipe.RollLeft.MaxSize := 0;
				MaterialWindingRecipe.RollLeft.MinSize := 0;
				MaterialWindingRecipe.RollRight.MaxSize := 0;
				MaterialWindingRecipe.RollRight.MinSize := 0;
				MaterialWindingRecipe.DataRegistration := FALSE;
				MaterialWindingRecipe.MaterialLength := 5;
				MpRecepieXml_0.FileName 				:= ADR('mappRecipe1Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_1;
		
			DONE_1:	// when CommandDone GoTo next step
				IF(MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 			:= CREATE_2;
					MpRecepieXml_0.Save			:= FALSE;
				END_IF;
		
			CREATE_2:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI) 
			
				MaterialWindingRecipe.TensionLeft := 0;
				MaterialWindingRecipe.TensionRight := 15;
				MaterialWindingRecipe.Speed := 5;
				MaterialWindingRecipe.Direction := FALSE;
				MaterialWindingRecipe.Motor1PID.P := 0;
				MaterialWindingRecipe.Motor1PID.I := 0;
				MaterialWindingRecipe.Motor2PID.P := 3;
				MaterialWindingRecipe.Motor2PID.I := 0;
				MaterialWindingRecipe.Motor3PID.P := 0;
				MaterialWindingRecipe.Motor3PID.I := 0;
				MaterialWindingRecipe.RollLeft.MaxSize := 26;
				MaterialWindingRecipe.RollLeft.MinSize := 0;
				MaterialWindingRecipe.RollRight.MaxSize := 0;
				MaterialWindingRecipe.RollRight.MinSize := 0;
				MaterialWindingRecipe.DataRegistration := FALSE;
				MaterialWindingRecipe.MaterialLength := 5;
				MpRecepieXml_0.FileName 			:= ADR('mappRecipe2Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_2;
		
			DONE_2:	// when CommandDone GoTo next step
				IF (MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 			:= CREATE_3;
					MpRecepieXml_0.Save			:= FALSE;
				END_IF;
		
			CREATE_3:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI)
			
				MaterialWindingRecipe.TensionLeft := 0;
				MaterialWindingRecipe.TensionRight := 15;
				MaterialWindingRecipe.Speed := 5;
				MaterialWindingRecipe.Direction := FALSE;
				MaterialWindingRecipe.Motor1PID.P := 0;
				MaterialWindingRecipe.Motor1PID.I := 0;
				MaterialWindingRecipe.Motor2PID.P := 0;
				MaterialWindingRecipe.Motor2PID.I := 0;
				MaterialWindingRecipe.Motor3PID.P := 0;
				MaterialWindingRecipe.Motor3PID.I := 0;
				MaterialWindingRecipe.RollLeft.MaxSize := 0;
				MaterialWindingRecipe.RollLeft.MinSize := 0;
				MaterialWindingRecipe.RollRight.MaxSize := 69;
				MaterialWindingRecipe.RollRight.MinSize := 0;
				MaterialWindingRecipe.DataRegistration := FALSE;
				MaterialWindingRecipe.MaterialLength := 5;
				MpRecepieXml_0.FileName 				:= ADR('mappRecipe3Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_3;
		
			DONE_3:	// when CommandDone creating recipes is done
				IF(MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 					:= CREATE_4;
					MpRecepieXml_0.Save					:= FALSE;
				END_IF;
			CREATE_4:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI)
			
				MaterialWindingRecipe.TensionLeft := 0;
				MaterialWindingRecipe.TensionRight := 23;
				MaterialWindingRecipe.Speed := 5;
				MaterialWindingRecipe.Direction := FALSE;
				MaterialWindingRecipe.Motor1PID.P := 0;
				MaterialWindingRecipe.Motor1PID.I := 0;
				MaterialWindingRecipe.Motor2PID.P := 0;
				MaterialWindingRecipe.Motor2PID.I := 0;
				MaterialWindingRecipe.Motor3PID.P := 0;
				MaterialWindingRecipe.Motor3PID.I := 0;
				MaterialWindingRecipe.RollLeft.MaxSize := 0;
				MaterialWindingRecipe.RollLeft.MinSize := 0;
				MaterialWindingRecipe.RollRight.MaxSize := 0;
				MaterialWindingRecipe.RollRight.MinSize := 68;
				MaterialWindingRecipe.DataRegistration := FALSE;
				MaterialWindingRecipe.MaterialLength := 5;
				MpRecepieXml_0.FileName 				:= ADR('mappRecipe4Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= REFRESH;
			
			REFRESH:	// refresh the recipe list to make sure all the recipes are shown
			
				IF(MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 					:= LOAD;
					MpRecepieXml_0	.Save					:= FALSE;
					UIConnect.Recipe.Refresh 	:= TRUE;
				END_IF;	
		
			LOAD:	// load the first recipe to have a default recipe
			
				IF(UIConnect.Status = mpRECIPE_UI_STATUS_IDLE)THEN
					UIConnect.Recipe.Load 		:= TRUE;
					RecipeCreateStep 					:= DONE_4;
				END_IF
			
			DONE_4:	// if loading was successful the creation of the recipes is done
		
				IF(UIConnect.Status = mpRECIPE_UI_STATUS_IDLE)THEN
					RecipeCreateStep 			:= ALL_DONE;
					UIConnect.Recipe.Refresh 	:= FALSE;
					UIConnect.Recipe.Load 		:= FALSE;
				END_IF;	
			
			ALL_DONE:
				
		
		END_CASE;
	
	//Edit Recipe
	IF RecipeControl.Edit.DialogOpen = TRUE THEN
		MaterialWidningEDITRecipe.TensionLeft := MaterialWindingRecipe.TensionLeft;
		MaterialWidningEDITRecipe.TensionRight := MaterialWindingRecipe.TensionRight;
		MaterialWidningEDITRecipe.Speed := MaterialWindingRecipe.Speed;
		MaterialWidningEDITRecipe.Direction := MaterialWindingRecipe.Direction;
		MaterialWidningEDITRecipe.Motor1PID.P := MaterialWindingRecipe.Motor1PID.P;
		MaterialWidningEDITRecipe.Motor1PID.I := MaterialWindingRecipe.Motor1PID.I;
		MaterialWidningEDITRecipe.Motor2PID.P := MaterialWindingRecipe.Motor2PID.P;
		MaterialWidningEDITRecipe.Motor2PID.I := MaterialWindingRecipe.Motor2PID.I;
		MaterialWidningEDITRecipe.Motor3PID.P := MaterialWindingRecipe.Motor3PID.P;
		MaterialWidningEDITRecipe.Motor3PID.I := MaterialWindingRecipe.Motor3PID.I;
		MaterialWidningEDITRecipe.RollLeft.MaxSize := MaterialWindingRecipe.RollLeft.MaxSize;
		MaterialWidningEDITRecipe.RollLeft.MinSize := MaterialWindingRecipe.RollLeft.MinSize;
		MaterialWidningEDITRecipe.RollRight.MaxSize := MaterialWindingRecipe.RollRight.MaxSize;
		MaterialWidningEDITRecipe.RollRight.MinSize := MaterialWindingRecipe.RollRight.MinSize;
		MaterialWidningEDITRecipe.DataRegistration := MaterialWindingRecipe.DataRegistration;
		MaterialWidningEDITRecipe.MaterialLength := MaterialWindingRecipe.MaterialLength;
		RecipeControl.Edit.DialogOpen							:= FALSE;
	END_IF

	IF RecipeControl.Edit.SaveRecipe = TRUE THEN
		MaterialWindingRecipe.TensionLeft := MaterialWidningEDITRecipe.TensionLeft;
		MaterialWindingRecipe.TensionRight := MaterialWidningEDITRecipe.TensionRight;
		MaterialWindingRecipe.Speed := MaterialWidningEDITRecipe.Speed;
		MaterialWindingRecipe.Direction := MaterialWidningEDITRecipe.Direction;
		MaterialWindingRecipe.Motor1PID.P := MaterialWidningEDITRecipe.Motor1PID.P;
		MaterialWindingRecipe.Motor1PID.I := MaterialWidningEDITRecipe.Motor1PID.I;
		MaterialWindingRecipe.Motor2PID.P := MaterialWidningEDITRecipe.Motor2PID.P;
		MaterialWindingRecipe.Motor2PID.I := MaterialWidningEDITRecipe.Motor2PID.I;
		MaterialWindingRecipe.Motor3PID.P := MaterialWidningEDITRecipe.Motor3PID.P;
		MaterialWindingRecipe.Motor3PID.I := MaterialWidningEDITRecipe.Motor3PID.I;
		MaterialWindingRecipe.RollLeft.MaxSize := MaterialWidningEDITRecipe.RollLeft.MaxSize;
		MaterialWindingRecipe.RollLeft.MinSize := MaterialWidningEDITRecipe.RollLeft.MinSize;
		MaterialWindingRecipe.RollRight.MaxSize := MaterialWidningEDITRecipe.RollRight.MaxSize;
		MaterialWindingRecipe.RollRight.MinSize := MaterialWidningEDITRecipe.RollRight.MinSize;
		MaterialWindingRecipe.DataRegistration := MaterialWidningEDITRecipe.DataRegistration;
		MaterialWindingRecipe.MaterialLength := MaterialWidningEDITRecipe.MaterialLength;
		UIConnect.Recipe.Save;
		IF (UIConnect.Status = mpRECIPE_UI_STATUS_IDLE) THEN
	  		RecipeControl.Edit.SaveRecipe := FALSE;
		END_IF;	
	END_IF
	

END_ACTION
