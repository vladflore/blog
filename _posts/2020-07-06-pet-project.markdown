---
layout: post
title: Pet Project
permalink: /pet-project-part1
author: Vlad
comments: true
---
## What's all about?

This post is the first from a series of posts about _my_ experience of building a small web application. 
You may already ask yourself, why building a web application? Well, what is the best way of _learning something new_ or _sharpening/acquiring some skills_?
You are right, _**practice**_ is the best way of achieving that.

## The motivation behind

There are hundreds of applications you could choose from to practise your programming skills, to learn a new language or framework, to generally challenge yourself by having to make something from scratch all by yourself. 
The _feeling good_ effect when you have finished your project will increase tenfold when your application will provide with some real-life help. 
This is another reason I decided to go for it and try to build a... shopping list web application.

## Outline of the shopping list application

### Business outline

As mentioned I will build a shopping list web application, which over the time will, hopefully, reach its purpose, which is to ease my shopping experience 
and help me get rid of that never ending Google Drive document ;)

As this is a one-man-show I will be the one to play the roles of:
* Project Manager
* Product Owner
* Architect
* Technical Lead
* Software Developer
* Software Tester
* DevOps 

The _**first iteration**_ should bring the app to the point where:

* multiple shopping lists can be created
* items can be added to the respective shopping lists

### Technical outline

I will split the app into three main areas, namely **backend**, **frontend** and **devops**. 
Each of them will include different technologies, language, frameworks, tools etc. as necessary.
Note on the versions: normally will go for the latest and greatest, but this could change as necessary.

#### Backend
* Spring Framework
* Spring Boot
* Java

#### Frontend
* Angular
* JavaScript
* HTML
* CSS

#### DevOps
* GitHub
* GitHub Actions / Jenkins
* AWS
* Ansible
* SonarQube

Additionally, I will enumerate the tools I will be using too (install the ones you are missing and pull up their documentation):
* Git (Version Control System)
* IntelliJ - Community or Ultimate (Integrated Development Environment) / Visual Studio Code
* Bash / [Fish] (Shells)
* [tmux] (Terminal Multiplexer)
* [Spring Boot CLI]
* [hub]

At a minimum you should have: an IDE, Git, Bash, Spring Boot CLI and hub.

## Initial preparation
Let's first set up the project skeleton considering the above.

{% highlight sh%}
# find a suitable location for the new project and
# create the directory for it
mkdir shopping-list && cd shopping-list

# initialize a Spring Boot - we'll be using the Spring Boot CLI
# this will create a folder named backend containing the Spring Boot maven project
spring init -a shopping-list-backend -g com.example -d=web,h2,data-jpa --description "shopping list backend powered by spring boot" -n shopping-list-backend backend
{% endhighlight %}

Now it is time to initialize the GH repository, we'll be doing this from the command line too (we'll be needing _hub_ for this).

{% highlight sh%}
# initialize a git repository and commit the current state of the project
git init
git add .
git commit -m "initial commit"

# use hub to create a private GH repository named shopping-list-app
# this command will also open the GH web page of the repository in question
hub create -po -d "shopping list app" shopping-list-app
{% endhighlight %}



[tmux]: https://github.com/tmux
[Fish]: https://fishshell.com/
[Spring Boot CLI]: https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-cli.html
[hub]: https://hub.github.com/