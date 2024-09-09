//%attributes = {}


$sel1:=ds:C1482.Training.query("ID_TrainingStatus = :1 and Review.Date >= :2"; 1; String:C10(Current date:C33; "y")+"/01/01")