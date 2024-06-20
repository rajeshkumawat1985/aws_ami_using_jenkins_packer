# aws_ami_using_packer_jenkins_job

- we will implement creation of aws ami's using packer and jenkins job

## Install Jenkins

```
INSTALLING JENKINS:
===================
- take t2.medium amazon linux 2 instance

- Install java:
sudo dnf install java-17-amazon-corretto-devel -y      ---> includes jdk

- Donwload Jenkins
use LTS version
https://pkg.jenkins.io/redhat-stable/

- add jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y

- when we install jenkins, it will create a service called jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins


Install Git:
============
sudo yum install git -y


IAM Role for Jenkins:
=====================
- provide iam role(to launch ec2 instances) to jenkins
- iam providing  admin access policy to iam role and attaching that role to jenkins


Install Docker and DockerCompose and provide permissions to jenkins user:
==========================================================================
- we are providing permissions to jenkins user because, by jenkins user our build will trigger
# Install Latest Docker
sudo yum install -y docker
[ec2-user@ip-172-31-47-69 ~]$ docker --version
Docker version 25.0.3, build 4debf41
sudo systemctl enable docker 
sudo systemctl start docker
sudo systemctl status docker
sudo usermod -aG docker ec2-user
newgrp docker
sudo usermod -aG docker jenkins
sudo systemctl restart docker
sudo systemctl restart jenkins

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
[ec2-user@ip-172-31-47-69 ~]$ docker-compose --version
Docker Compose version v2.27.1

- access jenkins
http://ip:8080

- REMOVE UNWANTED PLUGINS IF YOUR JENKINS IS SLOW IN LOADING 
```

## Jenkins Configurations

- create a new pipeline job in jenkins

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/2e5148c9-7f47-4b86-abe9-8292c076f0bd)

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/c507ef8e-124f-4fae-be9e-e8df8bada9fa)

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/bf5ba311-54e4-4379-86d3-aa66f7d6b24e)

```
- change all configs required in jenkins-packer-ami.pkr.hcl
- subnet-id
- security-group-id
- ssh-username
- instance-type

- below values should be declared in jenkins paramters
- region
- ami_name
- description
```

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/5822cef9-b952-49f7-ad20-41ee8ff6f8be)

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/baf60e26-983a-4147-97dc-9bdc80d78312)

- launch one ec2-instnace using that ami and check the configs

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/c889bc2c-bf53-4011-ab76-a91c99ec1a41)









