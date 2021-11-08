variable "gcp_project" {
  type = string
  description = "Project Number."
  default = "cv-solution-architect-lab"
}

variable "gcp_service_account" {
  type = string
  description = "Absolute file path to service account .json key file."
  default = null
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  default     = "ncv-vpc"
}

variable "region" {
  type        = string
  description = "Region where the instances should be created."
  default     = null
}

variable "volume_name" {
  type        = string
  description = "Name of CVS volume."
  default     = null
}

variable "protocol" {
  type        = list(string)
  description = "Enabled NAS protocols NFSv3, NFSv4, CIFS, SMB."
  default     = ["NFSv3"]
}

variable "size" {
  type        = number
  description = "Size of volume in GB"
  default     = 1024
}

variable "service_level" {
  type        = string
  description = "Service level standard, premium or extreme."
  default     = "premium"
}

variable "storage_class" {
  type        = string
  description = "Type of CVS service: CVS=software, CVS-Performance=hardware."
  default     = "hardware"
}

variable "ad_username" {
  type        = string
  description = "Active Directory username for joining domain."
  default     = "Administrator"
}

variable "ad_password" {
  type        = string
  description = "Password for Active Directory username for joining domain."
  default     = null
}

variable "ad_domain" {
  type        = string
  description = "Name of Active Directory domain."
  default     = null
}

variable "ad_dns" {
  type        = string
  description = "IP of Active Directory DNS server."
  default     = null
}

variable "ad_netbios" {
  type        = string
  description = "Netbios name for SMB server."
  default     = null
}

variable "ad_organizational_unit" {
  type        = string
  description = "Organizational Unit."
  default     = "CN=Computers"
}

variable "ad_site" {
  type        = string
  description = "Active Directory Site"
  default     = ""
}

# Client

# ud compute networks subnets list --format="value(region)" | while read region; do echo "\"$region\" = \"$region-c\""; done
variable "zone" {
  type = map
  default = {
    "us-central1" = "us-central1-c"
    "europe-west1" = "europe-west1-d"
    "us-west1" = "us-west1-c"
    "us-east1" = "us-east1-c"
    "asia-southeast1" = "asia-southeast1-c"
    "us-east4" = "us-east4-a"
    "australia-southeast1" = "australia-southeast1-c"
    "europe-west2" = "europe-west2-c"
    "europe-west3" = "europe-west3-c"
    "southamerica-east1" = "southamerica-east1-c"
    "asia-south1" = "asia-south1-c"
    "northamerica-northeast1" = "northamerica-northeast1-c"
    "europe-west4" = "europe-west4-c"
    "europe-north1" = "europe-north1-c"
    "us-west2" = "us-west2-c"
  }
}

variable "network_name" {
  default = "ncv-vpc"
}
# gcloud compute networks subnets list --format="value(region,name)" | while read region name; do echo "\"$region\" = \"$name\""; done
variable "network_subnet" {
  type = map
  default = {
    "us-central1" = "ncv-us-central1-priv-sn"
    "europe-west1" = "ncv-europe-west1-priv-sn"
    "us-west1" = "ncv-us-west1-priv-sn"
    "us-east1" = "ncv-us-east1-priv-sn"
    "asia-southeast1" = "ncv-asia-souteast1-priv-sn"
    "us-east4" = "ncv-us-east4-priv-sn"
    "australia-southeast1" = "ncv-australia-southeast1-priv-sn"
    "europe-west2" = "ncv-europe-west2-priv-sn"
    "europe-west3" = "ncv-europe-west3-priv-sn"
    "southamerica-east1" = "ncv-southamerica-east1-priv-sn"
    "asia-south1" = "ncv-asia-sout1-priv-sn"
    "northamerica-northeast1" = "ncv-northamerica-northeast1-priv-sn"
    "europe-west4" = "ncv-europe-west4-priv-sn"
    "europe-north1" = "ncv-europe-north1-priv-sn"
    "us-west2" = "ncv-us-west2-priv-sn"
  }
}

variable "machine_type" {
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
  default     = "e2-standard-2"
}

variable "min_cpu_platform" {
  description = "Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms, such as Intel Haswell or Intel Skylake. https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform"
  default     = "Automatic"
}

variable "name" {
  description = "Name prefix for the nodes"
  default     = "tf-custom"
}

variable "num_nodes" {
  description = "Number of nodes to create"
  default     = 1
}

variable "image_family" {
  default = "ubuntu-minimal-2004-lts"
}

variable "image_project" {
  default = "ubuntu-os-cloud"
}

variable "disk_auto_delete" {
  description = "Whether or not the disk should be auto-deleted."
  default     = true
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default     = 10
}

variable "access_config" {
  description = "The access config block for the instances. Set to [{}] for ephemeral external IP."
  type        = list
  default     = []
}

variable "network_ip" {
  description = "Set the network IP of the instance. Useful only when num_nodes is equal to 1."
  default     = ""
}

variable "node_tags" {
  description = "Additional compute instance network tags for the nodes."
  type        = list
  default     = []
}

variable "startup_script" {
  description = "Content of startup-script metadata passed to the instance template."
  default     = ":"
}

variable "metadata" {
  description = "Map of metadata values to pass to instances."
  type        = map
  default     = {}
}

variable "depends_id" {
  description = "The ID of a resource that the instance group depends on."
  default     = ""
}

variable "service_account_email" {
  description = "The email of the service account for the instance template."
  default     = ""
}

variable "service_account_scopes" {
  description = "List of scopes for the instance template service account"
  type        = list

  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/devstorage.full_control",
  ]
}
