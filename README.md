# remote-exec-provisioner-in-gcp
# Terraform 
Terraform is an open-source infrastructure as a code software tool created by HashiCorp. 
Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language, 
or optionally JSON.
# Remote-exec
The remote-exec provisioner invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, 
bootstrap into a cluster, etc. To invoke a local process, see the local-exec provisioner instead. 
The remote-exec provisioner requires a connection and supports both ssh and winrm.
# Information about this repo
With this repo, we can create the instance and download Nginx on that instance by developing the ssh connection through the connection block, 
followed by remote-exec which runs the apt command inside the instance.  

# step1 
Clone this repo
# step2
In the provider section just mention your credential name with the providers and also mention your project name with the region
# step3
Instance configuration would be the same just replace your user in metadata. User would the the image you are using(ubuntu,Debian) or project. 
And then write the path of the public key that you have create locally 
# step4
In the connection block, replace your user, private key path
# step5
Write the command terraform apply -auto-approve 
# step6
Take public IP and do :80 
# step7
You will see the Nginx page on your browser. 
