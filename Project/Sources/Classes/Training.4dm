Class extends DataClass

exposed Function allPlanned() : cs:C1710.TrainingSelection
	
/*If (Session=Null)
$obj:=Storage
Else 
$obj:=Session.storage
End if 
	
If ($obj.Employee.role=Null)
return Null
End if 
	
If ($obj.Employee.role="HR")
return ds.Training.query("ID_TrainingStatus = :1 and Review.Date >= :2"; 1; String(Current date; "y")+"/01/01")
Else 
return ds.Training.newSelection()
End if */
	
	return ds:C1482.Training.query("ID_TrainingStatus = :1 and Review.Date >= :2"; 1; String:C10(Current date:C33; "y")+"/01/01")
	