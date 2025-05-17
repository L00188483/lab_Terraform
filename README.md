



# lab_Terraform
This lab implements a scalable, secure cloud network architecture using Terraform for a company called FridayHITT. 
The aims of this lab are:

A scalable, secure design was created using Terraform and an infrastructure created. It must meet the business requirements of a network with public and private subnets, EC2 instances, security groups, routing tables, and other AWS services.
The infrastructure has a public EC2 instance and a private EC2 instance. The private instance should only be accessed securely, through a jump box (bastion host).
Security groups allow only essential traffic between components and from IP ranges.
Routing tables and an Internet Gateway were configured, to allow controlled access to the internet and block any unauthorised communication.
A jump box was to be deployed in the public subnet, to securely connect to the EC2 instance in the private subnet, using SSH.
In the future, the design should support multiple Availability Zones (AZs) for high availability.





#### Initial setup
```bash
$ terraform init
```

#### Creating your resources
```bash
$ terraform plan   # optional
$ terraform apply
```

#### Viewing the outputs
```bash
$ terraform output
```

#### Send a request to the private EC2 instance via the ALB
* go to: http://public-alb-2082044615.eu-west-1.elb.amazonaws.com/
* it should say "Hello from EC2"


#### SSH to the private instance via the jumpbox
```bash

# for the latest IP addresses re-run $ terraform output

ssh -i firstEC2instancekeypair.pem -o "ProxyCommand ssh -i firstEC2instancekeypair.pem -W %h:%p ec2-user@54.154.247.100" ec2-user@10.0.3.143
```
