//%attributes = {}
var $trainings : cs:C1710.TrainingSelection
var $year:=2024

//$reviews:=ds.Review.query("Employee.isActive = :1 AND ID_Status = :2 AND Date >= :3 AND Date <= :4 )"; True; 3; String($year)+"/01/01"; String($year)+"/12/31")

$trainings:=ds:C1482.Training.query("ID_TrainingStatus = :1 AND Review.Date >= :2 AND Review.Date <= :3"; 1; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")

