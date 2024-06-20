#cloud-boothook
#!/bin/bash

cp -a /home/ec2-user/.ssh /jenkins/
chown -R jenkins:jenkins /jenkins/.ssh
