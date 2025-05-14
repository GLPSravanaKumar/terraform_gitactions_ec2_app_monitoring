resource "aws_iam_role" "ec2_role" {
    name = "ec2wepapp-sns-helthcheck-role"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "glps-ec2webapp-sns-helthcheck-role"
  }
}

resource "aws_iam_role_policy_attachment" "sns" {
  role   = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}
resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-sns-helthcheck-profile"
  role = aws_iam_role.ec2_role.name
}