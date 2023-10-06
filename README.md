Terraform is a widely used IAC tool.
this tool is cloujd agnostic meaning any cloud provider can use it to design and deploy its infrastructure 
studying terraform has been a journey thus this snippet of a VPC setup
this project creates a Virtual Private Cloud which is AWS specific.
Within this VPC, we have
-  2 subnets(1 public and 1 private), 
- an internet gateway via which internet traffic passes
- route table for the entire internet ip and the internet gateway
- route table associate to associate our route table with the public subnet
- then we create an elasti ip for our nat gateway
- nat gateway and we allocate our elastic ip to it and add the public subnet in which our ip stays
- nat route table for the nat and the entire internet ip
- route table association for our private subnet and our route table

----> for this project we use 
-> variables to make our values reusable and to avoid hardcoding
-> data is used for the availability zone to automatically retrieve the AZs from any region specified
-> output to see the ids our resources from VScode once they are created
-> module is to call various code blocks in a particular location

---> here the create a folder module-vpc within which we have variables, vpc and output files
---> outside this module-vpc folder we have our main and provider file
---> in the main file we call our module that module-vpc to ran