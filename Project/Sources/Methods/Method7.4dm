//%attributes = {}


var $col : Collection:=New collection:C1472

$col.push({name: "Lastname"; formula: "This.data.review.Employee.Lastname"})
$col.push({name: "Firstname"; formula: "This.data.review.Employee.Firstname"})
$col.push({name: "CollaboratorName"; formula: "This.data.review.Employee.Firstname+\"\"+This.data.review.Employee.Lastname"})
$col.push({name: "Job"; formula: "This.data.review.Employee.Job"})
$col.push({name: "JobDescription"; formula: "This.data.review.Employee.Description"})
$col.push({name: "Departement"; formula: "This.data.review.Employee.Departement.Name"})
$col.push({name: "ManagerName"; formula: "This.data.review.Employee.Supervisor.Firstname+\"\"+This.data.review.Employee.Supervisor.Lastname"})

$col.push({name: "ReviewDate"; formula: "This.data.review.Date"})
$col.push({name: "PreviousReviewDate"; formula: "This.data.previousReviewDate"})
$col.push({name: "ReviewYear"; formula: "String(This.data.review.Date; \"y\")"})
$col.push({name: "PreviousReviewYear"; formula: "String(This.data.previousReviewDate; \"y\")"})

$col.push({name: "MobilityWish"; formula: "This.data.review.MobilityWish"})
$col.push({name: "MobilityMotivations"; formula: "This.data.review.MobilityMotivations"})

$col.push({name: "CollaboratorComment"; formula: "This.data.review.EmployeeComment"})
$col.push({name: "ManagerComment"; formula: "This.data.review.ManagerComment"})

$col.push({name: "ScoreGlobalCode"; formula: "This.data.review.ScoreGlobal.Code"})
$col.push({name: "ScoreGlobalName"; formula: "This.data.review.ScoreGlobal.Name"})

$col.push({name: "CkeckScoreGlobalCodeI"; formula: "Choose(This.data.review.ID_ScoreGlobal=1; \"X\"; \"\")"})
$col.push({name: "CkeckScoreGlobalCodeP"; formula: "Choose(This.data.review.ID_ScoreGlobal=2; \"X\"; \"\")"})
$col.push({name: "CkeckScoreGlobalCodeR"; formula: "Choose(This.data.review.ID_ScoreGlobal=3; \"X\"; \"\")"})
$col.push({name: "CkeckScoreGlobalCodeE"; formula: "Choose(This.data.review.ID_ScoreGlobal=4; \"X\"; \"\")"})


$o:={expression: $col}

SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($o; *))