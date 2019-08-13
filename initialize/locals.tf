locals {
  /** UpperCamel */
  project_name          = "${var.project_name}"
  project_name_uc       = "${replace(title(var.project_name), "-", "")}"
  project_name_stn      = "PKCD"
  environment           = "${terraform.workspace}"
  is_dev                = "${local.environment == "dev"}"
  bucket_name_artifacts = "${local.project_name}-artifacts-${random_id.bucket.hex}"
  domain_prefix         = "${local.is_dev ? "dev." : ""}"
  parallelism           = "--parallelism=30"
  # -----------------------------------------------
  # CodeBuild
  # -----------------------------------------------
  build_type         = "LINUX_CONTAINER"
  build_compute_type = "BUILD_GENERAL1_SMALL"
  build_image        = "aws/codebuild/standard:2.0"
}
