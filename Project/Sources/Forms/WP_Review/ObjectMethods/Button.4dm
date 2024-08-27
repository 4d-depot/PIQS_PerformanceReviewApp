var $context : Object:=New object:C1471

$context.review:=ds:C1482.Review.get(3)

//WParea:=WP New($context.review.Document)
WP SET DATA CONTEXT:C1786(WParea; $context)


