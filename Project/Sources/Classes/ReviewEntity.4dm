Class extends Entity

//Mark:- Generate next review
exposed Function createReview($idEmployee : Integer)
	var $PrevReview : cs:C1710.ReviewEntity
	
	$sel:=ds:C1482.Review.query("ID_Employee = :1"; $idEmployee).orderBy("Date desc")
	
	This:C1470.Date:=Current date:C33
	This:C1470.ID_Employee:=$idEmployee
	This:C1470.ID_Status:=1
	This:C1470.save()
	
	// Generate Skill
	$obj:=New object:C1471
	$skillSettings:=This:C1470.Employee.Departement.Skill
	For each ($obj; $skillSettings.skill)
		For each ($name; $obj.value)
			$skill:=ds:C1482.Skill.new()
			$skill.Name:=$name
			$skill.Group:=$obj.group
			$skill.ID_Score:=(Random:C100%4)+1
			$skill.ID_Review:=This:C1470.ID
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
	
	//Mark:- Generate document
	
Function createContext()->$context : Object
	$context:=New object:C1471
	$context.review:=This:C1470
	$context.previousReviewDate:=This:C1470.previousReview.Date
	return $context
	
Function generateDocument()->$doc : Object
	
	// Create context
	$context:=This:C1470.createContext()
	
	// Load template
	$template:=This:C1470.Employee.Departement.Template.Template
	
	// Create 4D Write Pro document
	$doc:=WP New:C1317($template)
	WP SET DATA CONTEXT:C1786($doc; $context)
	WP COMPUTE FORMULAS:C1707($doc)
	
	return $doc
	
exposed Function generateFreezeDocument()->$freezeDoc : Object
	
	var $obj : Object
	
	$freezeDoc:=This:C1470.generateDocument()
	WP FREEZE FORMULAS:C1708($freezeDoc)
	
	return $freezeDoc
	
exposed Function generatePDF()
	var $WPdoc : Object
	var $blob : 4D:C1709.Blob
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	Use ($obj.Employee)
		$tmp:=$obj.Employee.role
		$obj.Employee.role:="ComputeDoc"
	End use 
	
	$WPdoc:=This:C1470.generateFreezeDocument()
	WP EXPORT VARIABLE:C1319($WPdoc; $blob; wk pdf:K81:315)
	
	This:C1470.DocumentPDF:=$blob
	This:C1470.ID_Status:=4  //Archived
	This:C1470.save()
	
	Use ($obj.Employee)
		$obj.Employee.role:=$tmp
	End use 
	
	//Mark:- Goals
exposed Function createGoal()->$goal : cs:C1710.GoalEntity
	$goal:=ds:C1482.Goal.new()
	$goal.ID_GoalStatus:=1
	$goal.ID_Review:=This:C1470.ID
	return $goal
	
exposed Function get plannedGoal() : cs:C1710.GoalSelection
	return This:C1470.Goals.query("ID_GoalStatus = :1"; 1)
	
exposed Function get doneGoals() : cs:C1710.GoalSelection
	return This:C1470.Goals.query("ID_GoalStatus = :1"; 2)
	
	//Mark:- Trainings
exposed Function createTraining($idStatus : Integer)->$training : cs:C1710.TrainingEntity
	$training:=ds:C1482.Training.new()
	$training.ID_TrainingStatus:=$idStatus
	$training.ID_Review:=This:C1470.ID
	return $training
	
exposed Function get plannedTraining() : cs:C1710.TrainingSelection
	return This:C1470.Trainings.query("ID_TrainingStatus = :1"; 1)
	
exposed Function get doneTraining() : cs:C1710.TrainingSelection
	return This:C1470.Trainings.query("ID_TrainingStatus in :1"; [2; 3; 4])
	