# aws_ami_using_jenkins_packer

- we will implement creation of aws ami's using jenkins job using packer

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

sudo yum install git -y

- access jenkins
http://ip:8080

- REMOVE UNWANTED PLUGINS IF YOUR JENKINS IS SLOW IN LOADING 
```

## Packer Configurations

- create a new free-style job in jenkins

![image](https://github.com/vijay2181/aws_ami_using_jenkins_packer/assets/66196388/34cdf0d8-e7fe-442d-a889-2ef7911ccc67)




