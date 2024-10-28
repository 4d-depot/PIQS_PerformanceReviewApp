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

var $col : Collection
var $e : Object

var $goal : cs:C1710.GoalEntity
var $rstatus : cs:C1710.ReviewStatusEntity
var $tstatus : cs:C1710.TrainingStatusEntity
var $score : cs:C1710.ScoreEntity

$col:=$obj.GoalStatus
For each ($e; $col)
	$goal:=ds:C1482.GoalStatus.new()
	$goal.ID:=$e.ID
	$goal.Name:=$e.Name
	$goal.save()
End for each 

$col:=$obj.ReviewStatus
For each ($e; $col)
	$rstatus:=ds:C1482.ReviewStatus.new()
	$rstatus.ID:=$e.ID
	$rstatus.Name:=$e.Name
	$rstatus.Description:=$e.Description
	$rstatus.save()
End for each 

$col:=$obj.TrainingStatus
For each ($e; $col)
	$tstatus:=ds:C1482.TrainingStatus.new()
	$tstatus.ID:=$e.ID
	$tstatus.Name:=$e.Name
	$tstatus.save()
End for each 

$col:=$obj.Score
For each ($e; $col)
	$score:=ds:C1482.Score.new()
	$score.ID:=$e.ID
	$score.Name:=$e.Name
	$score.Code:=$e.Code
	$score.save()
End for each 