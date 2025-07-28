
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
			
				gHMI.Recipe.CurrentRecipe.TensionLeft := 0;
				gHMI.Recipe.CurrentRecipe.TensionRight := 15;
				gHMI.Recipe.CurrentRecipe.Speed := 5;
				gHMI.Recipe.CurrentRecipe.Direction := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.I := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.DataRegistration := FALSE;
				gHMI.Recipe.CurrentRecipe.MaterialLength := 5;

				MpRecepieXml_0.FileName 				:= ADR('mappRecipe1Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_1;
		
			DONE_1:	// when CommandDone GoTo next step
				IF(MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 			:= CREATE_2;
					MpRecepieXml_0.Save			:= FALSE;
				END_IF;
		
			CREATE_2:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI) 
				gHMI.Recipe.CurrentRecipe.TensionLeft := 0;
				gHMI.Recipe.CurrentRecipe.TensionRight := 15;
				gHMI.Recipe.CurrentRecipe.Speed := 5;
				gHMI.Recipe.CurrentRecipe.Direction := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.I := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.DataRegistration := FALSE;
				gHMI.Recipe.CurrentRecipe.MaterialLength := 5;

				MpRecepieXml_0.FileName 			:= ADR('mappRecipe2Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_2;
		
			DONE_2:	// when CommandDone GoTo next step
				IF (MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 			:= CREATE_3;
					MpRecepieXml_0.Save			:= FALSE;
				END_IF;
		
			CREATE_3:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI)
				
				gHMI.Recipe.CurrentRecipe.TensionLeft := 0;
				gHMI.Recipe.CurrentRecipe.TensionRight := 15;
				gHMI.Recipe.CurrentRecipe.Speed := 5;
				gHMI.Recipe.CurrentRecipe.Direction := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.I := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.DataRegistration := FALSE;
				gHMI.Recipe.CurrentRecipe.MaterialLength := 5;

				MpRecepieXml_0.FileName 				:= ADR('mappRecipe3Test.xml');
				MpRecepieXml_0.Save					:= TRUE;
				RecipeCreateStep 					:= DONE_3;
		
			DONE_3:	// when CommandDone creating recipes is done
				IF(MpRecepieXml_0.CommandDone) THEN
					RecipeCreateStep 					:= CREATE_4;
					MpRecepieXml_0.Save					:= FALSE;
				END_IF;
			CREATE_4:	// create the next recipe with default values, file name and a known picture index (Bitmap Group in the HMI)
			
				gHMI.Recipe.CurrentRecipe.TensionLeft := 0;
				gHMI.Recipe.CurrentRecipe.TensionRight := 15;
				gHMI.Recipe.CurrentRecipe.Speed := 5;
				gHMI.Recipe.CurrentRecipe.Direction := FALSE;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer1PID.I := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.P := 0;
				gHMI.Recipe.CurrentRecipe.Dencer2PID.I := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollLeft.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MaxSize := 0;
				gHMI.Recipe.CurrentRecipe.RollRight.MinSize := 0;
				gHMI.Recipe.CurrentRecipe.DataRegistration := FALSE;
				gHMI.Recipe.CurrentRecipe.MaterialLength := 5;

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
		MaterialWidningEDITRecipe.TensionLeft := gHMI.Recipe.CurrentRecipe.TensionLeft;
		MaterialWidningEDITRecipe.TensionRight := gHMI.Recipe.CurrentRecipe.TensionRight;
		MaterialWidningEDITRecipe.Speed := gHMI.Recipe.CurrentRecipe.Speed;
		MaterialWidningEDITRecipe.Direction := gHMI.Recipe.CurrentRecipe.Direction;
		MaterialWidningEDITRecipe.Dencer1PID.P := gHMI.Recipe.CurrentRecipe.Dencer1PID.P;
		MaterialWidningEDITRecipe.Dencer1PID.I := gHMI.Recipe.CurrentRecipe.Dencer1PID.I;
		MaterialWidningEDITRecipe.Dencer2PID.P := gHMI.Recipe.CurrentRecipe.Dencer2PID.P;
		MaterialWidningEDITRecipe.Dencer2PID.I := gHMI.Recipe.CurrentRecipe.Dencer2PID.I;
		MaterialWidningEDITRecipe.RollLeft.MaxSize := gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize;
		MaterialWidningEDITRecipe.RollLeft.MinSize := gHMI.Recipe.CurrentRecipe.RollLeft.MinSize;
		MaterialWidningEDITRecipe.RollRight.MaxSize := gHMI.Recipe.CurrentRecipe.RollRight.MaxSize;
		MaterialWidningEDITRecipe.RollRight.MinSize := gHMI.Recipe.CurrentRecipe.RollRight.MinSize;
		MaterialWidningEDITRecipe.DataRegistration := gHMI.Recipe.CurrentRecipe.DataRegistration;
		MaterialWidningEDITRecipe.MaterialLength := gHMI.Recipe.CurrentRecipe.MaterialLength;
		RecipeControl.Edit.DialogOpen							:= FALSE;
	END_IF

	IF RecipeControl.Edit.SaveRecipe = TRUE THEN
		gHMI.Recipe.CurrentRecipe.TensionLeft := MaterialWidningEDITRecipe.TensionLeft;
		gHMI.Recipe.CurrentRecipe.TensionRight := MaterialWidningEDITRecipe.TensionRight;
		gHMI.Recipe.CurrentRecipe.Speed := MaterialWidningEDITRecipe.Speed;
		gHMI.Recipe.CurrentRecipe.Direction := MaterialWidningEDITRecipe.Direction;
		gHMI.Recipe.CurrentRecipe.Dencer1PID.P := MaterialWidningEDITRecipe.Dencer1PID.P;
		gHMI.Recipe.CurrentRecipe.Dencer1PID.I := MaterialWidningEDITRecipe.Dencer1PID.I;
		gHMI.Recipe.CurrentRecipe.Dencer2PID.P := MaterialWidningEDITRecipe.Dencer2PID.P;
		gHMI.Recipe.CurrentRecipe.Dencer2PID.I := MaterialWidningEDITRecipe.Dencer2PID.I;
		gHMI.Recipe.CurrentRecipe.RollLeft.MaxSize := MaterialWidningEDITRecipe.RollLeft.MaxSize;
		gHMI.Recipe.CurrentRecipe.RollLeft.MinSize := MaterialWidningEDITRecipe.RollLeft.MinSize;
		gHMI.Recipe.CurrentRecipe.RollRight.MaxSize := MaterialWidningEDITRecipe.RollRight.MaxSize;
		gHMI.Recipe.CurrentRecipe.RollRight.MinSize := MaterialWidningEDITRecipe.RollRight.MinSize;
		gHMI.Recipe.CurrentRecipe.DataRegistration := MaterialWidningEDITRecipe.DataRegistration;
		gHMI.Recipe.CurrentRecipe.MaterialLength := MaterialWidningEDITRecipe.MaterialLength;
		UIConnect.New.FileName := MpRecepieXml_0.Info.LastLoadedRecipe;
		UIConnect.New.Create := TRUE;
		IF (UIConnect.Status = mpRECIPE_UI_STATUS_IDLE) THEN
			UIConnect.New.Create := FALSE;
			RecipeControl.Edit.SaveRecipe := FALSE;
		END_IF;

	END_IF
	

END_ACTION
