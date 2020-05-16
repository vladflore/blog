---
layout: post
title: SonarQube on AWS EC2
permalink: /sonarqube
author: Vlad
comments: true
---
In this post I will share my experience with installing the SonarQube on an AWS EC2 instance.
What you'll see below are some steps and hints when it comes to such an installation.

The motivation behind

I wanted a Sonar Server running in the cloud so that my GitHub projects could benefit from it.
It is always a good idea to have some quality checks performed on your code and some way to drill down 
through them and get an idea on how good or bad your code is. I also didn't want to make my own cloud, so
I just sticked with AWS EC2 solution, despite the fact that it is not always for free. Make sure to check 
the documentation and the billing policies to not have any surprises at the end of the month.

As I said I want to use Sonar for my current and future GitHub projects, which means I want it 
configured specifically to my needs, which are:

* the quality checks (history) should be persisted, a.k.a, an in-memory database will not suffice
* I want mutation testing enabled and configured together with the default Java rules and use these to check the code

Having said this, let's start with the installation.

Step 1

Get an AWS EC2 instance up and running

Step 2

Prepare the EC2 instance for Sonar installation

* update the system
* install unzip tool
* install java 11
* install postgresql 12
    * prepare the postgresql installation for Sonar
* add inbound rule(tcp for port 9000) for the security group the instance belongs to

Step 3

Download the SonarQube Server

Step 4

Create user for SonarQube (permissions and to start the server with)

Step 5

Configure SonarQube properties and launch scripts

Post installation steps

1. dealing with _bootstrap checks failed_ error

http://<IPv4 Public IP>:9000/

Configure Sonar
* add mutation testing support
* create new quality profile

Analyze code and push to Sonar, see [post]({% post_url 2020-05-13-code-katas %})
