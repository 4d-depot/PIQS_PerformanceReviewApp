Class extends DataClass

exposed Function loadTraining($Departement : cs:C1710.DepartementEntity; $status : cs:C1710.TrainingStatusEntity; $year : Integer) : cs:C1710.TrainingSelection
	
	Case of 
		: (($Departement=Null:C1517) && ($status=Null:C1517))
			return This:C1470.query("Review.Date >= :1 AND Review.Date <= :2"; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
		: (($Departement#Null:C1517) && ($status=Null:C1517))
			return This:C1470.query("Review.Employee.ID_Departement = :1 AND Review.Date >= :2 AND Review.Date <= :3"; $Departement.ID; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
		: (($Departement#Null:C1517) && ($status#Null:C1517))
			return This:C1470.query("Review.Employee.ID_Departement = :1 AND ID_TrainingStatus = :2 AND Review.Date >= :3 AND Review.Date <= :4"; $Departement.ID; $status.ID; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
	End case 