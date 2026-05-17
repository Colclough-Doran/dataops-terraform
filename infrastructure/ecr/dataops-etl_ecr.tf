module "ecr_dataops_etl" {
  source = "../../modules/ecr"

  ecr_repository_name        = "dataops-etl"
  image_tag_mutability_value = "MUTABLE"
}