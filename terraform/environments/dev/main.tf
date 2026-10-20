module "networking" {
  source = "../../modules/networking"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "iam" {
  source = "../../modules/iam"

  project_name        = var.project_name
  environment         = var.environment
  secrets_manager_arn = var.secrets_manager_arn
}

module "compute" {
  source = "../../modules/compute"

  project_name              = var.project_name
  environment               = var.environment
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = module.networking.public_subnet_id
  security_group_ids        = [module.networking.security_group_id]
  iam_instance_profile_name = module.iam.iam_instance_profile_name
  key_name                  = var.key_name
}
