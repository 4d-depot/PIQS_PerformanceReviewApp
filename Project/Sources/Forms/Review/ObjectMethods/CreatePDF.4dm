var $year : Text
$year:=Request:C163("Enter a year:")

// Create all reviews
ds:C1482.Review.generateAllPDF(Num:C11($year))