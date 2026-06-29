variable "resource_group_name" {
  type        = string
  description = "Resource group EXISTANT, fourni par l'école (renseigné dans terraform.tfvars)."
}

variable "cluster_name" {
  type    = string
  default = "aks-formation"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "tags" {
  type = map(string)
  default = {
    formation = "aks"
    module    = "1-fondamentaux"
  }
}