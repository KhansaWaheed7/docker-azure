variable "rg_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "tfstaticwebsitestg-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "image_name" {
  description = "Docker image to deploy in Azure Container Instance"
  type        = string
}
