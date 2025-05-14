resource "aws_sns_topic" "health_topic" {
  name = "glps-health-check-topic"
}