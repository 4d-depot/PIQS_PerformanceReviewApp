Class extends DataClass

Function event restrict() : cs:C1710.ReviewSelection
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	If ($obj.Employee.role=Null:C1517)
		return Null:C1517
	End if 
	
	Case of 
		: ($obj.Employee.role="HR")
			If (This:C1470.query("ID_Employee = :1 and Employee.Departement.Name = :2"; $obj.Employee.ID; "HR").first()#Null:C1517)
				return This:C1470.all().orderBy("Date desc")
			End if 
			return ds:C1482.Employee.newSelection()
			
		: ($obj.Employee.role="Manager")
			return This:C1470.query("Employee.ID_Supervisor = :1"; $obj.Employee.ID).orderBy("Date desc")
			
		: ($obj.Employee.role="Collaborator")
			return This:C1470.query("ID_Employee = :1"; $obj.Employee.ID).orderBy("Date desc")
			
		Else 
			return Null:C1517
			
	End case 
	
	
	