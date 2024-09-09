//%attributes = {}
//Type table
$obj:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Status.json").getText())

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


$obj:=JSON Parse:C1218(File:C1566("/RESOURCES/File.json").getText())

$departements:=$obj.Departement
For each ($e; $scores)
	$s:=ds:C1482.Departement.new()
	$s.ID:=$e.ID
	$s.Name:=$e.Name
	$s.Skill:=$e.Skill
	$s.ID_Template:=$e.ID_Template
	$s.save()
	
	//loop employee
	$manager:=ds:C1482.Employee.new()
	$manager.Firstname:=$obj.Firstname[$i]
	$manager.Lastname:=$obj.Lastname[$i]
	$manager.Job:=$e.ManagerJob
	$manager.Description:=$e.ManagerDescription
	$manager.ID_Supervisor:=1111
	$manager.ID_Departement:=$e.ID
	$manager.Email:=Lowercase:C14($manager.Firstname)+"."+Lowercase:C14($manager.Lastname)+"@company.com"
	
	
End for each 





//$obj:=JSON Parse(File("/RESOURCES/Dataset/Collaborator.json").getText())

