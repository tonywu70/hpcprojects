## Deploy BeeGFS Master
[![Click to deploy template on Azure](http://azuredeploy.net/deploybutton.png "Click to deploy template on Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftonywu70%2Fhpcprojects%2Fmaster%2Fbeegfs-master.json)  

## Deploy BeeGFS OSS, MDS and Client
[![Click to deploy template on Azure](http://azuredeploy.net/deploybutton.png "Click to deploy template on Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftonywu70%2Fhpcprojects%2Fmaster%2Fdeploy-beegfs.json)  

## Deploy BeeGFS Master(HDD)
[![Click to deploy template on Azure](http://azuredeploy.net/deploybutton.png "Click to deploy template on Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftonywu70%2Fhpcprojects%2Fmaster%2Fbeegfs-master-hdd.json)  

## Deploy BeeGFS OSS, MDS and Client(HDD)
[![Click to deploy template on Azure](http://azuredeploy.net/deploybutton.png "Click to deploy template on Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftonywu70%2Fhpcprojects%2Fmaster%2Fdeploy-beegfs-hdd.json)  


### Check your deployment
Once the deployment succeed, login to the master vm and run beegfs-check-servers command

* Templates contain maximum available VM sizes however availability of VMs depends on the data center. Not all VM sizes are available in every data center. please make sure to do check it out before the selection of VM sku size.
* Templates do not have a check to match number of disks supported by a VM. Please make sure to input correct number of disks which is supported by the VM selected for deployment.
* There are few scripts that exist in "/home/username/Scripts" (username is the user created at the time of deployment.)
	* Provide permission to scripts with sudo chmod +x <scriptname>
	* Execute a script with "sudo bash <scriptname>"
	* Install azure CLI using script install_azureCLI.sh as scripts making updates on azure will require azure CLI for execution.
	* Get a list of nodes in BeeGFS cluster. The list is an output of beegfs-check-servers command. Script name is BeeGFSListNode.sh, no parameters are required.
	* Resize a VM and increase/decrease capacity of a scale set. Script name is changesize.sh. Please go through a document available inside "Scripts/ResizeVMinScaleSet".
	* Start/stop/restart a virtual machine scale set. Script name is vmss.sh. Syntax: sudo bash ./vmss.sh <resourcegroup> <vmss name> <action (start/deallocate/stop)>
* In BeeGFS cluster only master node has public IP which can be used to connect to it. To know private IP addresses of other nodes run following commands on master node:
	* beegfs-ctl --listnodes --nodetype=meta --nicdetails - To get details about meta nodes.
	* beegfs-ctl --listnodes --nodetype=storage --nicdetails - To get details about storage nodes.
