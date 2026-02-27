#Terraform Block:

terraform {
    required_providers{
        azurerm = {

            source = "hashicorp/azurerm"
            version = "~> 3.0"
        }   
    }
}

#Provider Block:

provider "azurerm" {
    features{}
    #you can include your subscription id here
}

