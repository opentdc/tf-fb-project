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

variable "project_version" {
  description = "The version of the firebase project, e.g. 01, 02, 03"
  type        = string
  default     = "01"
}

variable "project_id" {
  description = "The project id of the firebase project, 6-30 characters, lowercase only, with digits and hypens, must start with a letter. Uniquely identifies the project to Google. Use naming convention: app-nn-env-platform, e.g. bka-01-dev-web."
  type        = string
}