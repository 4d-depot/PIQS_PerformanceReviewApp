Class extends DataClass

exposed Function loadEmployees($idDepartement : Integer) : cs:C1710.EmployeeSelection
	
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
			If (This:C1470.query("ID = :1 and Departement.Name = :2"; $obj.Employee.ID; "HR").first()#Null:C1517)
				If ($idDepartement>0)
					return This:C1470.query("ID_Departement = :1"; $idDepartement)
				Else 
					return This:C1470.all()
				End if 
			End if 
			return ds:C1482.Employee.newSelection()
			
		: ($obj.Employee.role="Manager")
			return This:C1470.query("ID_Supervisor = :1"; $obj.Employee.ID)
			
		: ($obj.Employee.role="Collaborator")
			return This:C1470.query("ID = :1"; $obj.Employee.ID)
			
		Else 
			return Null:C1517
			
	End case 
	