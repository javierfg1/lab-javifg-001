resource "aws_sqs_queue" "report_requests_dlq" {
  name = "report-requests-dlq"
}

/* Se ppuede usar la fuente de datos si ya esta creada la dql
data "aws_sqs_queue" "dlq_attrs" {
  name = "report-requests-dlq"
}
*/

resource "aws_sqs_queue" "report_requests" {
  name = "report-requests"
  redrive_policy = jsonencode({
    /*deadLetterTargetArn : data.aws_sqs_queue.dlq_attrs.arn,*/
    deadLetterTargetArn :  aws_sqs_queue.report_requests_dlq.arn,
    maxReceiveCount : 3
    })
}