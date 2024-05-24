variable "project_name" {
  description = "The name of the firebase project, 4-30 characters, case-insensitive, with numbers, hyphens, single- and double Quotes, spaces. It is only used within Firebase interfaces and not visible to end-users."
  type        = string
}

variable "billing_account" {
  description = "The billing account id of the firebase project, format is 'XXXXXX-XXXXXX-XXXXXX'"
  type        = string
}

variable "app_id" {
  description = "The app id of the firebase project, 3-5 lowercase chars, followed by 2 digits as a version, separated by a hyphen. e.g. bka."
  type        = string
}

variable "version" {
  description = "The version of the firebase project, e.g. 01, 02, 03"
  type        = string
  default     = "01"
}

variable "project_id" {
  description = "The project id of the firebase project, 6-30 characters, lowercase only, with digits and hypens, must start with a letter. Uniquely identifies the project to Google. Use naming convention: app-nn-env-platform, e.g. bka-01-dev-web."
  type        = string
  default     = var.app_id + "-" + var.version
}