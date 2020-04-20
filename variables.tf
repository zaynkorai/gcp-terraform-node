# # Creds and default location
variable "credentials" { default = "keys/service-account.json" } // Change with you service account .json file
variable "project" { default = "" }                              // Your GCP Project ID
variable "region" { default = "us-central1" }
variable "zone" { default = "us-central1-a" }

# # Keys
variable "public_key" {
  description = "Path to file containing public key"
  default     = "keys/public_key"
}
