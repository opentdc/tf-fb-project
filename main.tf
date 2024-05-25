# Copyright [2024] [Bruno Kaiser]

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0
# SPDX-License-Identifier: Apache-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

terraform {
  required_version = "~> 1.8"
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

# Configure the provider not to use the specified project for quota check.
# This provider should only be used during project creation and initializing services.
provider "google-beta" {
  alias                 = "no_user_project_override"
  user_project_override = false
}

# Configure the provider that uses the new project's quota.
provider "google-beta" {
  user_project_override = true
}


# Create a new Google Cloud project.
resource "google_project" "test" {
  provider        = google-beta.no_user_project_override
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "firebase" = "enabled"
  }
}

# Enable the required underlying Service Usage API.
resource "google_project_service" "serviceusage" {
  provider  = google-beta.no_user_project_override
  project   = var.project_id
  service   = "serviceusage.googleapis.com"

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Enable the required underlying Firebase Management API.
resource "google_project_service" "firebase" {
  provider  = google-beta.no_user_project_override
  project   = var.project_id
  service   = "firebase.googleapis.com"

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Enable Firebase services for the new project created above.
resource "google_firebase_project" "test" {
  provider  = google-beta
  project   = var.project_id

  # Wait until the required APIs are enabled.
  depends_on = [
    google_project_service.firebase,
    google_project_service.serviceusage,
  ]
}




