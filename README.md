# Test Devops Assignment
This project uses Terraform to create a GKE cluster, and deploy a sample application to it. It also uses modular Terraform structure and is powered by Terratest for IaC tests.

## Requirements
* Google Cloud Platform account
* Terraform
* Terratest
* Google Cloud SDK
* kubectl

## Usage
1. Clone this repository and navigate to the project ``environments/develop`` directory.

2. [Set up a service account](https://cloud.google.com/iam/docs/service-accounts-create) for Terraform to use, and download the JSON key file. You can do this by following the instructions in the [Google Cloud Platform documentation](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).

_**NOTE**_: Ensure your service account has these roles or for test you can bind owner role to your service account(NOT recommended in production!)

* compute.networks.create
* container.

3. Export the path to the JSON key file as an environment variable:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/keyfile.json
```
Also, you can use ``credentials`` key of google provider to address your json file from your local system. It is commented in ``providers.tf`` for you.

4. Initialize the Terraform modules:

```bash
terraform init
```
5. Customize the ``environments/your-env/terraform.tfvars`` file to your needs. You can change the region, zone, cluster name, and other configuration options here.

6. Provision the GKE cluster and apply resources using Terraform:
```bash
terraform plan
terraform apply
```

7. (Optional) This project will create a kubeconfig file in your environment directory. You can connect to your kubernetes cluster api-server via kubectl by exporting this variable:

```bash
export KUBECONFIG=/path-to-your-kubeconfig-file
# exp: get k8s nodes 
kubectl get nodes
```

Also, you can get your cluster kubeconfig by gcloud command:

```bash
gcloud container clusters get-credentials <cluster_name> --region <google_region>
```

# Run Tests
It will run your terraform on specific GCP project and checks some part of your Iac to realize they are working correctly. The tests are written using [Gruntwork's Terratest library](https://terratest.gruntwork.io) containing:

* Bringing your terraform code up using terraform apply
* Verify desired kubernetes nodes are up and ready.
* Checks your application service type is ``LoadBalancer``
* Expected 200 http response code and content on your application service.
* Destroy all the project using terraform destroy

To Run the tests follow these steps:
1. Navigate to the ``test`` directory
2. Initialize your GO module using these commands:

```bash
export GO111MODULE=auto
go mod init test
go mod tidy
```

3. Run your tests by:

```bash
go test -v -timeout 40m
```

Wait to tests run. Next you should see ``PASS`` as a result of your tests.

```
--- PASS: TestTerraformGcpHelloWorldExample (1870.07s)
PASS
ok      test    1870.081s
```

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.