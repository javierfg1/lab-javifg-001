resource "aws_sqs_queue" "terraform_queue" {
  name                      = "report-requests"
  delay_seconds             = 2
  max_message_size          = 2048
  message_retention_seconds = 
  receive_wait_time_seconds = 1
  
  tags = {
    Environment = "lab-sqs"
  }
}