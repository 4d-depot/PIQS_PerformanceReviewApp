//%attributes = {"invisible":true}
var $comment : Object:=New object:C1471
var $goals : Object:=New object:C1471
var $trainings : Object:=New object:C1471

var $commentFile; $goalsFile; $trainingsFile : Object

$commentFile:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Comments.json").getText())
$goalsFile:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Goals.json").getText())
$trainingsFile:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Trainings.json").getText())

var $employees : cs:C1710.EmployeeSelection
var $skillSettings : cs:C1710.SkillSelection
var $sel : cs:C1710.ReviewSelection
var $PrevReview : cs:C1710.ReviewEntity
var $employee : cs:C1710.EmployeeEntity
var $review : cs:C1710.ReviewEntity
var $skill : cs:C1710.SkillEntity
var $goal : cs:C1710.GoalEntity
var $training : cs:C1710.TrainingEntity

var $y; $pos; $i; $m; $d : Integer
var $date : Date
var $obj : Object
var $name : Text

var $colComment; $colGoals; $colTrainings : Collection

TRUNCATE TABLE:C1051([Review:2])
TRUNCATE TABLE:C1051([Goal:3])
TRUNCATE TABLE:C1051([Training:5])
TRUNCATE TABLE:C1051([Skill:6])
SET DATABASE PARAMETER:C642([Review:2]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Training:5]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Goal:3]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Skill:6]; Table sequence number:K37:31; 0)

For ($y; 2020; 2025)
	
	$employees:=ds:C1482.Employee.all()
	
	For each ($employee; $employees)
		
		Case of 
			: ($employee.ID_Departement=1)  // PO
				$colComment:=$commentFile.CommentsPO
				$colGoals:=$goalsFile.GoalsPO
				$colTrainings:=$trainingsFile.TrainingsPO
				
			: ($employee.ID_Departement=4)  // DEV
				$colComment:=$commentFile.CommentsDEV
				$colGoals:=$goalsFile.GoalsDEV
				$colTrainings:=$trainingsFile.TrainingsDEV
				
			: ($employee.ID_Departement=3)  // QA
				$colComment:=$commentFile.CommentsQA
				$colGoals:=$goalsFile.GoalsQA
				$colTrainings:=$trainingsFile.TrainingsQA
				
			: ($employee.ID_Departement=2)  // Sales
				$colComment:=$commentFile.CommentsSales
				$colGoals:=$goalsFile.GoalsSales
				$colTrainings:=$trainingsFile.TrainingsSales
				
			: ($employee.ID_Departement=5)  // HR
				$colComment:=$commentFile.CommentsHR
				$colGoals:=$goalsFile.GoalsHR
				$colTrainings:=$trainingsFile.TrainingsHR
				
			Else 
				
		End case 
		
		
		$m:=Random:C100%3+1
		$d:=Random:C100%28+1
		$date:=Date:C102(String:C10($d)+"/"+String:C10($m)+"/"+String:C10($y))
		
		// Create review
		$review:=ds:C1482.Review.new()
		$review.ID_Employee:=$employee.ID
		$review.Date:=$date
		$pos:=Random:C100%10
		$review.ManagerComment:=$colComment[$pos].Manager
		$review.EmployeeComment:=$colComment[$pos].Collaborator
		$review.MobilityMotivations:=$colComment[$pos].Wish
		$review.MobilityWish:=$colComment[$pos].Motivation
		$review.ID_ScoreGlobal:=(Random:C100%4)+1
		$review.ID_ScoreGoal:=(Random:C100%4)+1
		$review.ID_ScoreSkill:=(Random:C100%4)+1
		$review.ID_Status:=4
		
		// Generate Skill
		$obj:=New object:C1471
		$skillSettings:=$employee.Departement.Skill
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
		
		// Create new Goals
		$pos:=Random:C100%10
		For ($i; 1; 4)
			$goal:=ds:C1482.Goal.new()
			$pos:=($pos+1)%10
			$goal.Name:=$colGoals[$pos].Title
			$goal.PerformanceIndicator:=$colGoals[$pos].KPI
			$goal.Comment:=$colGoals[$pos].Comment
			$goal.DueDate:=String:C10($y)
			$goal.ID_GoalStatus:=1  // planned
			$goal.ID_Review:=$review.ID
			$goal.save()
		End for 
		
		// Create new Trainings
		For ($i; 1; 3)
			$training:=ds:C1482.Training.new()
			$pos:=($pos+1)%10
			$training.Name:=$colTrainings[$pos].Title
			$training.ExpectedResult:=$colTrainings[$pos].ExpectedValue
			$training.ProfessionalValue:=$colTrainings[$pos].ProfessionalValue
			$training.ID_TrainingStatus:=1  // planned
			$training.ID_Review:=$review.ID
			$training.save()
		End for 
		
		// Check if previous review
		$sel:=ds:C1482.Review.query("ID_Employee = :1"; $employee.ID).orderBy("Date desc")
		If ($sel.length>0)
			$PrevReview:=$sel.first()
			
			$review.ID_PreviousReview:=$PrevReview.ID
			
			// Copy previous Goals
			$obj:=New object:C1471
			$goals:=$PrevReview.plannedGoal
			For each ($obj; $goals)
				$goal:=ds:C1482.Goal.new()
				$goal.Name:=$obj.Name
				$goal.PerformanceIndicator:=$obj.PerformanceIndicator
				$goal.DueDate:=$obj.DueDate
				$goal.Comment:=$obj.Comment
				$goal.ID_GoalStatus:=2
				$goal.ID_Score:=(Random:C100%4)+1
				$goal.ID_Review:=$review.ID
				$goal.save()
			End for each 
			
			// Copy previous Trainings
			$obj:=New object:C1471
			$trainings:=$PrevReview.plannedTraining
			For each ($obj; $trainings)
				$training:=ds:C1482.Training.new()
				$training.Name:=$obj.Name
				$training.ExpectedResult:=$obj.ExpectedResult
				$training.ProfessionalValue:=$obj.ProfessionalValue
				$training.ID_TrainingStatus:=(Random:C100%2)+2
				$training.ID_Review:=$review.ID
				$training.save()
			End for each 
			
		End if 
		
		If (($review.ID_Employee=1) || ($review.ID_Employee=2) || ($review.ID_Employee=41) || ($review.ID_Employee=42) || ($review.ID_Employee=81))
			$review.generatePDF()
		End if 
		
		$review.save()
		
	End for each 
	
End for 