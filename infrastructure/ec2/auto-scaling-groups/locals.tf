locals {
  service       = "ec2/auto-scaling-roups"
  terraform_url = "https://codeberg.org/codo/dataops-infrastructure/src/branch/main/infrastructure/${local.service}"

  scale_down_schedules = {
    "0000" = { time = "0 0 * * *", start_time = "2026-05-16T00:00:00Z" }
    "1800" = { time = "0 18 * * *", start_time = "2026-05-16T18:00:00Z" }
  }

  scale_up_schedules = {
    "0700" = { time = "0 7 * * *", start_time = "2026-05-16T07:00:00Z" }
  }
}