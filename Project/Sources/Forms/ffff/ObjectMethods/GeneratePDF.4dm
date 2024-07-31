

$filePath:=Folder:C1567(fk desktop folder:K87:19).file("Export/entretien.pdf")
$filePath.create()
Form:C1466.CurrentReview.generatePDF($filePath.platformPath)

OPEN URL:C673($filePath.platformPath)