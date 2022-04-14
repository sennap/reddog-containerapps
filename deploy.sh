# *nix only
export RG="reddog"
export LOCATION="eastus2"
export SUB_ID="<id>"

# Follow Azure CLI prompts to authenticate to your subscription of choice
az login 
az account set --subscription $SUB_ID

# Create resource group
az group create -n reddog -l eastus

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g reddog -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g reddog -o json --query properties.outputs.urls.value