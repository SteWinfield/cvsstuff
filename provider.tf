//configure the providers
provider "google" {
project	="cv-solution-architect-lab"
 region		="eu-west-2"
 }

// And also AWS
provider "aws" {
	access_key = "xxx"
	secret_key = "xxx"
	region     = "us-east-1"
}

// And Azure
provider "azurerm" {
 subscription_id = "xxx"
 client_id	 = "xxx"
 client_secret 	 = "xxx"
 tenant_id 	 = "xxx"
}

terraform {
  required_providers {
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "21.5.0"
    }
  }
}

provider "netapp-gcp" {
	project         = "823997568320"
	service_account = "/home/swinfield/terraform/serviceacc.json"
	#credentials = "${file("/home/swinfield/terraform/serviceacc.json")}"
  # Configuration options
}

