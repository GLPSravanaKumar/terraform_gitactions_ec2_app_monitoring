resource "aws_sns_topic" "health_topic" {
  name = "glps-health-check-topic"
}
resource "aws_sns_topic_subscription" "sms_subscription" {
  topic_arn = aws_sns_topic.health_topic.arn
  protocol  = "email-json"
  endpoint  = "glps369@gmail.com"
}