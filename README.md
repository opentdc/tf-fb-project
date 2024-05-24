# Terraform module to create a Firebase project 

This is a Terraform module to create a new Firebase Google cloud project. 
It requires the [Google Cloud SDK][] to be installed locally and an
existing [Firebase project][Firebase console]. 

To get started:

1.  Install the [Google Cloud SDK][], [Terraform][Terraform install], and
    [Git][Git install].

2.  Create a [Firebase project][Firebase console] with the Blaze Plan.

3.  Add the following config to your terraform tf file:

    ```
    module "tf-fb-project" {
        source            = "github.com/opentdc/tf-fb-project"
        project_name      = local.project_name
        billing_account   = local.billing_account
        app_id            = local.app_id
        project_version   = local.project_version
        project_id        = local.project_id
    }
    ```

4.  Run `terraform init && terraform apply`


## Input variables

| Variable Name               | Type      | Usage       | Default         | Description                                        |
|-----------------------------|-----------|-------------|-----------------|----------------------------------------------------|
| project_id                  | string    | mandatory   |                 | The Firebase project ID                            |
| project_name                | string    | mandatory   |                 | The name of the Firebase project                   |
|                             |           |             |                 | 4-30 characters, case-insensitive, with numbers    |
|                             |           |             |                 | hypens, quotes, spaces. It is only used internally |
| billing_account             | string    | mandatory   |                 | The billing account ID of the firebase project.    |
|                             |           |             |                 | Firebase projects must be at least on blaze plan.  |
|                             |           |             |                 | format:  'XXXXX-XXXXX-XXXXX'                       |
| app_id                      | string    | mandatory   |                 | The app id of the firebase app, e.g. bka           |
|                             |           |             |                 | 3-5 lowercase characters                           |
| project_version             | string    | optional    |  01             | a number to make the app_id unique internally      |


## Output
None