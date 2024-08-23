Class extends Entity

exposed Function load() : cs:C1710.ReviewEntity
	
	return ds:C1482.Review.get(3)
	
Function createContext() : Object
	$context:=New object:C1471
	$context.review:=This:C1470
	$context.previousReview:=This:C1470.previousReview
	return $context
	
Function generateFreezeDocument()
	
Function generatePDF($filePath : Text)
	
	WP EXPORT DOCUMENT:C1337(This:C1470.DocumentFreeze; $filePath; wk pdf:K81:315)
	
	
exposed Function get plannedTraining() : cs:C1710.TrainingSelection
	
	return This:C1470.Trainings.query("ID_TrainingStatus = :1"; 1)
	
exposed Function get Training() : cs:C1710.TrainingSelection
	
	return This:C1470.Trainings.query("ID_TrainingStatus in :1"; [2; 3; 4])
	
	
exposed Function get previousTodoTraining() : cs:C1710.TrainingSelection
	
	return This:C1470.previousReview.Trainings.query("ID_TrainingStatus = :1"; 1)