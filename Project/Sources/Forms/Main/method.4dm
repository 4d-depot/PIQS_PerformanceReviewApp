
Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.subDepartement:=New object:C1471()
		Form:C1466.subDepartement.CurrentSelection:=ds:C1482.Departement.all()
		
		Form:C1466.subCollaborator:=New object:C1471()
		Form:C1466.subCollaborator.currentSelection:=ds:C1482.Employee.all()
		
		Form:C1466.subTemplate:=New object:C1471()
		Form:C1466.subTemplate.CurrentSelection:=ds:C1482.Template.all()
End case 