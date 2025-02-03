//%attributes = {"invisible":true}
var $collaboratorFile : Object

$collaboratorFile:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Collaborator.json").getText())

var $departement : cs:C1710.DepartementEntity
var $employee : cs:C1710.EmployeeEntity
var $obj : Object
var $pos; $i : Integer
var $idManager : Integer

TRUNCATE TABLE:C1051([Departement:10])
TRUNCATE TABLE:C1051([Employee:1])
SET DATABASE PARAMETER:C642([Departement:10]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Employee:1]; Table sequence number:K37:31; 0)

$pos:=0

For each ($obj; $collaboratorFile.Departement)
	
	$departement:=ds:C1482.Departement.new()
	$departement.Name:=$obj.Name
	$departement.ID_Template:=$obj.ID_Template
	$departement.Skill:=$obj.Skill
	$departement.save()
	
	$employee:=ds:C1482.Employee.new()
	$employee.Lastname:=$collaboratorFile.Lastname[$pos]
	$employee.Firstname:=$collaboratorFile.Firstname[$pos]
	$employee.Job:=$obj.Manager
	$employee.Description:=$obj.ManagerDescription
	$employee.ID_Supervisor:=81
	$employee.ID_Departement:=$departement.ID
	$employee.Email:=$employee.Firstname+"."+$employee.Lastname+"@company.com"
	$employee.Password:=Generate password hash:C1533("test")
	$employee.isActive:=True:C214
	$employee.save()
	$idManager:=$employee.ID
	$pos+=1
	
	For ($i; 1; 19)
		$employee:=ds:C1482.Employee.new()
		$employee.Lastname:=$collaboratorFile.Lastname[$pos]
		$employee.Firstname:=$collaboratorFile.Firstname[$pos]
		$employee.Job:=$obj.Collaborator
		$employee.Description:=$obj.CollaboratorDescription
		$employee.ID_Supervisor:=$idManager
		$employee.ID_Departement:=$departement.ID
		$employee.Email:=$employee.Firstname+"."+$employee.Lastname+"@company.com"
		$employee.Password:=Generate password hash:C1533("test")
		$employee.isActive:=True:C214
		$employee.save()
		$pos+=1
	End for 
	
End for each 