Class extends DataClass

exposed Function loadPlannedTraining($Departement : cs:C1710.DepartementEntity; $year : Integer)
	If ($Departement=Null:C1517)
		return This:C1470.query("ID_TrainingStatus = :1 AND Review.Date >= :2 AND Review.Date <= :3"; 1; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
	Else 
		return This:C1470.query("ID_TrainingStatus = :1 AND Review.Date >= :2 AND Review.Date <= :3 AND Review.Employee.ID_Departement = :4"; 1; String:C10($year)+"/01/01"; String:C10($year)+"/12/31"; $Departement.ID)
	End if 