---
layout: post
title: SonarQube on AWS EC2
permalink: /sonarqube
author: Vlad
comments: true
---
In this post I will share my experience with installing SonarQube on an AWS EC2 instance. What you'll see below are some steps and hints when it comes to installing SonarQube.

#### The motivation behind

I wanted a SonarQube Server running in the cloud so that my GitHub projects could benefit of it. It is always a good idea to have some quality checks performed on your code and some way to drill down through them and get an idea on how good or bad your code is. I also didn't want to set up my own cloud, so I just sticked with AWS EC2 solution, despite the fact that it is not always for free.

Make sure to check the documentation and the billing policies to not have any surprises at the end of the month. In case you do not need the instances to run all the time you can stop them and only start them when you need them. A stopped instance is billed differently and less than a running one.

As I said, I want to use Sonar for my GitHub projects, which means I want it configured specifically to my needs, which are:

* the quality checks (history) should be persisted, a.k.a, an in-memory database will not suffice. I will use PostgreSQL 12.
* I want mutation testing enabled and I want to use these rules together with the default rules to check the code. As for the language I will initially start with Java.

Having said this, let's start with the installation.

#### Step 1

Get an AWS EC2 instance up and running.

There is not much to say here, check the documentation and follow the steps, it's pretty intuitive and no brainer at all. After having done that - the instance is running and you can SSH into it, proceed with the next step.

#### Step 2

Prepare the EC2 instance for SonarQube installation. You won't have pretty much anything pre-installed so you'll have to do it yourself.

> **_NOTE:_** most of the commands require sudo access, so...you have been warned!

* update the system
{% highlight sh %}
sudo apt update
sudo apt upgrade
{% endhighlight %}

* install unzip tool
{% highlight sh %}
sudo apt install unzip
{% endhighlight %}

* install Java 11 (SonarQube 8.3 requires Java - Oracle JRE 11 or OpenJDK 11 - installed on the machine, I'll go with OpenJDK)
{% highlight sh %}
sudo apt install openjdk-11-jdk
{% endhighlight %}

* install PostgreSQL 12 (before running the command _add the PostgreSQL apt repository_ as documented [here][postgresql])
{% highlight sh %}
sudo apt install postgresql-12
{% endhighlight %}

* prepare PostgreSQL for SonarQube (this basically means creating the user and the database)
{% highlight sh %}
# change current user to postgres
# (this was created for you as part of the PostgreSQL installation)
sudo su - postgres
# go into PostgreSQL
psql
{% endhighlight %}
{% highlight sql %}
--- create the user
CREATE USER sonarqube WITH PASSWORD 'yourPassword';
--- create the database
CREATE DATABASE sonarqube OWNER sonarqube;
--- grant the privileges
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube;
--- exit PostgreSQL
\q
{% endhighlight %}

* add inbound rule(tcp for port 9000) for the security group the instance belongs to

#### Step 3

Download the SonarQube Server.

{% highlight sh %}
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.3.0.34182.zip
unzip sonarqube-8.3.0.34182.zip
# move the unzipped folder under /opt
sudo mv sonarqube-8.3.0.34182 /opt/sonarqube
{% endhighlight %}

#### Step 4

Create user for SonarQube

{% highlight sh %}
sudo adduser --system --no-create-home --group --disabled-login sonarqube
sudo chown -R sonarqube:sonarqube /opt/sonarqube
{% endhighlight %}

#### Step 5

Configure SonarQube properties and launch scripts.

Edit `sonar.properties` and add the following properties:

{% highlight sh%}
vi /opt/sonarqube/conf/sonar.properties
{% endhighlight %}

```
sonar.jdbc.username=sonarqube
sonar.jdbc.password=yourPassword
sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
sonar.web.javaAdditionalOpts=-server
sonar.web.host=0.0.0.0
```

Edit `sysctl.conf` and set the property `vm.max_map_count` to `262144`. SonarQube will most likely not start without it!

```
vi /etc/sysctl.conf
```
```
vm.max_map_count=262144
```

Edit `sonar.sh` and set the variable `RUN_AS_USER` to `sonarqube`.
```
vi /opt/sonarqube/bin/linux-x86-64/sonar.sh
```
```
RUN_AS_USER=sonarqube
```

Post installation steps

1. dealing with _bootstrap checks failed_ error

http://<IPv4 Public IP>:9000/

Configure Sonar
* add mutation testing support
* create new quality profile

[postgresql]: https://www.postgresql.org/download/linux/ubuntu/