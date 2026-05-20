include {
  path = find_in_parent_folders("root-terragrunt.hcl")
}

terraform {
  source = "./"
}