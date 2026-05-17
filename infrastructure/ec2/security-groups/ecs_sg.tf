module "security_group_ecs" {
  source = "../../../modules/ec2/security-groups/ecs"

  security_group_name        = "ecs-basic"
  security_group_description = "Security group for basic ECS ports"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr_block             = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}