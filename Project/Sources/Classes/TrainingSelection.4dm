Class extends EntitySelection

exposed Function generateTrainingCSV()->$b : 4D:C1709.Blob
/*var $o : cs.TrainingEntity
$csv:=""
For each ($o; This)
$csv:=$csv+$o.Review.Employee.Firstname+";"+$o.Review.Employee.Lastname+";"+$o.Name+";"+$o.ExpectedResult+";"+$o.Status.Name+"\n"
End for each 
*/
	var $csv : Text
	//$csv:="azerty rtghjjj dggghh"
	
	//$b:=Folder(Temporary folder; fk platform path).file("trainings.csv").setText($csv).getContent()
	
	
	return $b