//%attributes = {}
var $obj : Object
$obj:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Status.json").getText())

TRUNCATE TABLE:C1051([GoalStatus:15])
TRUNCATE TABLE:C1051([ReviewStatus:11])
TRUNCATE TABLE:C1051([TrainingStatus:14])
TRUNCATE TABLE:C1051([Score:12])
SET DATABASE PARAMETER:C642([GoalStatus:15]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([ReviewStatus:11]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([TrainingStatus:14]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Score:12]; Table sequence number:K37:31; 0)

$goals:=$obj.GoalStatus
For each ($e; $goals)
	$s:=ds:C1482.GoalStatus.new()
	$s.ID:=$e.ID
	$s.Name:=$e.Name
	$s.save()
End for each 

$reviews:=$obj.ReviewStatus
For each ($e; $reviews)
	$s:=ds:C1482.ReviewStatus.new()
	$s.ID:=$e.ID
	$s.Name:=$e.Name
	$s.Description:=$e.Description
	$s.save()
End for each 

$trainings:=$obj.TrainingStatus
For each ($e; $trainings)
	$s:=ds:C1482.TrainingStatus.new()
	$s.ID:=$e.ID
	$s.Name:=$e.Name
	$s.save()
End for each 

$scores:=$obj.Score
For each ($e; $scores)
	$s:=ds:C1482.Score.new()
	$s.ID:=$e.ID
	$s.Name:=$e.Name
	$s.Code:=$e.Code
	$s.save()
End for each 