locals {
  # Converts nested list into a single list
  # list = [["a", "b"], ["c"], ["d", "e"]] => ["a", "b", "c", "d", "e"]
  flattened_cluster_access = flatten([
    for key, access in var.cluster_access : [
      for policy_arn in access.policy_arn : {
        policy_arn        = policy_arn,
        principal_arn     = access.principal_arn,
        access_scope_type = access.access_scope_type
      }
    ]
  ])
}