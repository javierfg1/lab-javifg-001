output "dlq_arn" {
  description = "The arn of the dlq."
  value = aws_sqs_queue.report_requests_dlq.arn
}