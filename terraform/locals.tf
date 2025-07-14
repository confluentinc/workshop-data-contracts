#####
# General local variables
#####

locals {
  # Generate unique suffix for resource names
  resource_suffix = random_id.env_display_id.hex
  prefix          = "${var.call_sign}-${var.project_name}"

  # Common tags
  common_tags = {
    Name        = "${local.prefix}-${local.resource_suffix}"
    Project     = "Hospitality AI Agent"
    Environment = var.environment
    Created_by  = "River Hotels AI Agent Terraform script"
    owner_email = var.email
  }
}
