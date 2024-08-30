Class extends Entity

exposed Function createReview($idEmployee : Integer)
	var $PrevReview : cs:C1710.ReviewEntity
	
	$sel:=ds:C1482.Review.query("ID_Employee = :1"; $idEmployee).orderBy("Date desc")
	
	This:C1470.Date:=Current date:C33
	This:C1470.ID_Employee:=$idEmployee
	This:C1470.ID_Status:=1
	This:C1470.save()
	
	// Generate Skill
	$obj:=New object:C1471
	$skillSettings:=ds:C1482.Settings.query("ID = :1"; This:C1470.Employee.Departement.ID).first().Skill
	For each ($obj; $skillSettings.skill)
		For each ($name; $obj.value)
			$skill:=ds:C1482.Skill.new()
			$skill.Name:=$name
			$skill.Group:=$obj.group
			$skill.ID_Score:=(Random:C100%4)+1
			$skill.ID_Review:=$review.ID
			$skill.save()
		End for each 
	End for each 
	
	If ($sel.length>0)
		$PrevReview:=$sel.first()
		
		This:C1470.ID_PreviousReview:=$PrevReview.ID
		This:C1470.save()
		
		// Copy previous Goals
		var $goal : cs:C1710.GoalEntity
		$obj:=New object:C1471
		$goals:=$PrevReview.plannedGoal
		
		For each ($obj; $goals)
			$goal:=ds:C1482.Goal.new()
			$goal.Name:=$obj.Name
			$goal.PerformanceIndicator:=$obj.PerformanceIndicator
			$goal.DueDate:=$obj.DueDate
			$goal.ID_GoalStatus:=2
			$goal.ID_Review:=This:C1470.ID
			$goal.save()
		End for each 
		
		// Copy previousTrainings
		var $training : cs:C1710.TrainingEntity
		$obj:=New object:C1471
		$trainings:=$PrevReview.plannedTraining
		
		For each ($obj; $trainings)
			$training:=ds:C1482.Training.new()
			$training.Name:=$obj.Name
			$training.ExpectedResult:=$obj.ExpectedResult
			$training.ID_TrainingStatus:=4
			$training.ID_Review:=This:C1470.ID
			$training.save()
		End for each 
		
	End if 
	
Function createContext() : Object
	$context:=New object:C1471
	$context.review:=This:C1470
	$context.previousReviewDate:=This:C1470.previousReview.Date
	return $context
	
Function generateDocument() : Object
	
	// Create context
	$context:=This:C1470.createContext()
	
	// Load template
	$template:=ds:C1482.Template.get(1).Template
	
	// Create 4D Write Pro document
	$doc:=WP New:C1317($template)
	WP SET DATA CONTEXT:C1786($doc; $context)
	WP COMPUTE FORMULAS:C1707($doc)
	This:C1470.Document:=$doc
	This:C1470.save()
	return $doc
	
exposed Function generateFreezeDocument()
	
	$freezeDoc:=This:C1470.generateDocument()
	WP FREEZE FORMULAS:C1708($freezeDoc)
	
	// Save doc
	This:C1470.DocumentFreeze:=$freezeDoc
	This:C1470.save()
	
exposed Function generatePDF()
	
	$name:=This:C1470.Employee.Firstname+This:C1470.Employee.Lastname+"_"+String:C10(This:C1470.Date; "Y")
	
	$filePath:=File:C1566("/RESOURCES/pdf/"+$name+".pdf")
	WP EXPORT DOCUMENT:C1337(This:C1470.DocumentFreeze; $filePath.platformPath; wk pdf:K81:315)
	
	This:C1470.DocumentPDF:=$filePath.getContent()
	This:C1470.save()
	
	
	//Mark:- Goals
exposed Function get plannedGoal() : cs:C1710.GoalSelection
	return This:C1470.Goals.query("ID_GoalStatus = :1"; 1)
	
exposed Function get doneGoals() : cs:C1710.GoalSelection
	return This:C1470.Goals.query("ID_GoalStatus = :1"; 2)
	
	//Mark:- Trainings
exposed Function get plannedTraining() : cs:C1710.TrainingSelection
	return This:C1470.Trainings.query("ID_TrainingStatus = :1"; 1)
	
exposed Function get doneTraining() : cs:C1710.TrainingSelection
	return This:C1470.Trainings.query("ID_TrainingStatus in :1"; [2; 3; 4])
	