Class extends DataStoreImplementation

exposed Function authentify($email : Text; $password : Text) : Text
	var $page : Text:="Login"
	var $pageCollaborator : Text:="CollaboratorPage"
	var $obj : Object
	var $employee : cs:C1710.Employee
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	If ($obj.Employee=Null:C1517)
		Use ($obj)
			$obj.Employee:=New shared object:C1526
		End use 
	End if 
	
	If ($obj.Settings=Null:C1517)
		Use ($obj)
			$obj.Settings:=New shared object:C1526
		End use 
	End if 
	
	Use ($obj.Settings)
		$obj.Settings.Departement:=0
	End use 
	
	Use ($obj.Employee)
		$obj.Employee.authentify:=False:C215
	End use 
	
	$employee:=This:C1470.Employee.query("Email = :1"; $email).first()
	
	If ($employee#Null:C1517)
		If (Verify password hash:C1534($password; $employee.Password))
			
			Use ($obj.Employee)
				$obj.Employee.ID:=$employee.ID
				$obj.Employee.name:=$employee.Firstname+" "+$employee.Lastname
				$obj.Employee.role:="Collaborator"
				$obj.Employee.maxRole:="Collaborator"
				$page:=$pageCollaborator
				
				If ($employee.ID_Departement=5)
					Session:C1714.setPrivileges("hr")
					$obj.Employee.maxRole:="HR"
				Else 
					Session:C1714.setPrivileges("user")
					If ($employee.Collaborator.length>0)
						$obj.Employee.maxRole:="Manager"
					End if 
				End if 
				$obj.Employee.authentify:=True:C214
			End use 
			
			
			
			Session:C1714.setPrivileges("user")
			Web Form:C1735.setMessage("Authentication successfull")
			
		Else 
			Web Form:C1735.setError("Authentication failed: wrong password")
		End if 
	Else 
		Web Form:C1735.setError("Authentication failed: wrong user")
	End if 
	
	return $page
	
exposed Function selectRole($role : Text)
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	Use ($obj.Employee)
		$obj.Employee.role:=$role
	End use 
	
exposed Function getUserInfo : Object
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee
	Else 
		return Session:C1714.storage.Employee
	End if 
	