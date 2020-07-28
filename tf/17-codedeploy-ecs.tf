# https://github.com/tmknom/terraform-aws-codedeploy-for-ecs

module "codedeploy_ecs" {
  source                            = "git::https://github.com/tmknom/terraform-aws-codedeploy-for-ecs.git?ref=tags/1.2.0"
  name                              = var.codedeploy_name
  description                       = var.codedeploy_description

  ecs_cluster_name                  = var.ecs_cluster_name
  ecs_service_name                  = var.ecs_service_name

  lb_listener_arns                  = [var.codedeploy_lb_listener_arns]
  blue_lb_target_group_name         = var.codedeploy_blue_lb_target_group_name
  green_lb_target_group_name        = var.codedeploy_green_lb_target_group_name

  auto_rollback_enabled             = var.codedeploy_auto_rollback_enabled
  auto_rollback_events              = var.codedeploy_auto_rollback_events

  action_on_timeout                 = var.codedeploy_action_on_timeout
  wait_time_in_minutes              = var.codedeploy_wait_time_in_minutes
  termination_wait_time_in_minutes  = var.codedeploy_termination_wait_in_minutes

  #test_traffic_route_listener_arns = var.codedeploy_test_traffic_route_listener_arns

  #iam_path                         = "/"

  #tags = {
  #}
}