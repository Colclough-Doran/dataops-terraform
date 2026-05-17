module "ecr_repo_dataops" {
  source = "../../modules/ecr"

  ecr_repository_name        = "dataops"
  image_tag_mutability_value = "IMMUTABLE"
}