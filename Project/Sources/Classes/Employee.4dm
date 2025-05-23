Class extends DataClass

Function event restrict() : cs:C1710.EmployeeSelection
	
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	Case of 
		: (Session:C1714.hasPrivilege("authentify"))
			return This:C1470.all()
			
		: (Session:C1714.hasPrivilege("generatePDF"))
			return This:C1470.all()
			
		: (Session:C1714.hasPrivilege("createReview"))
			return This:C1470.all()
			
		: (Session:C1714.hasPrivilege("webadmin"))
			return This:C1470.all()
			
		: ($obj.Employee.role="Collaborator")
			return This:C1470.query("ID = :1"; $obj.Employee.ID)
			
		: ($obj.Employee.role="Manager")
			return This:C1470.query("ID_Supervisor = :1"; $obj.Employee.ID)
			
		: (($obj.Employee.role="HR") && (Session:C1714.hasPrivilege("hr")))
			return This:C1470.all()
			
		Else 
			return This:C1470.newSelection()
			
	End case 
	
exposed Function loadEmployees($departement : cs:C1710.DepartementEntity; $isActive : Boolean) : cs:C1710.EmployeeSelection
	If ($departement#Null:C1517)
		return This:C1470.query("ID_Departement = :1 AND isActive = :2"; $departement.ID; $isActive)
	Else 
		return This:C1470.query("isActive = :1"; $isActive)
	End if 