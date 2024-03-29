resource "aws_launch_template" "dashboard_asg_template" {
  name = lookup(
    var.lt_name,
    terraform.workspace,
    lookup(var.lt_name, "default", ""),
  )

  image_id = var.ami_id
  instance_type = lookup(
    var.instance_type,
    terraform.workspace,
    lookup(var.instance_type, "default", ""),
  )
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_http_asg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "launch-template-demo"
    }
  }

  user_data = filebase64("${path.module}/user_data.sh")
}