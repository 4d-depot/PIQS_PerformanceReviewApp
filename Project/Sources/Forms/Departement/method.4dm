Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.departement:=ds:C1482.Departement.all()
		
		Form:C1466.Template:=ds:C1482.Template.all()
		
		templateList:=New list:C375
		
		For each ($tmp; Form:C1466.Template)
			APPEND TO LIST:C376(templateList; $tmp.Name; $tmp.ID)
		End for each 
		
		OBJECT SET LIST BY REFERENCE:C1266(*; "Column3"; Choice list:K42:19; templateList)
		
End case 