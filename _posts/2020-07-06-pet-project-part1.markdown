---
layout: post
title: Pet Project (1/)
permalink: /pet-project-part1
author: Vlad
modified_date: 2020-10-06
---
## What's all about?

This is **part 1** of the **Pet Project series** about building a small web application from scratch.
 
You may already ask yourself, why building a web application? Well, what is the best way of _learning something new_ or _sharpening/acquiring some skills_?
You are right, _**practice**_ is the best way of achieving that.

Project posts:
* [part 2]({{ site.baseurl }}{% post_url 2020-07-14-pet-project-part2 %})
* [part 3]({{ site.baseurl }}{% post_url 2020-10-06-pet-project-part3 %})

## The motivation behind

There are hundreds of applications you could choose from to practise your programming skills, to learn a new language or framework, to generally challenge yourself by having to make something from scratch all by yourself. 
The _feeling good_ effect when you have finished your project will increase tenfold when your application will provide you with some real-life help. 
This is another reason I decided to go for it and try to build a... shopping list web application.

## Outline of the shopping list application

### Business outline

As mentioned I will build a shopping list web application, which over the time will, hopefully, reach its purpose, which is to ease my shopping experience 
and help me get rid of that never-ending Google Drive document ;)

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

Note on the versions: I will normally go for the latest and greatest, but this might change as necessary.

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

I will update this list as necessary.

At a minimum, you should have: an IDE, Git, Bash, Spring Boot CLI and hub.

## Initial preparation
Let's first set up the project skeleton considering the above.

{% highlight sh%}
# find a suitable location for the new project and
# create the directory for it
mkdir shopping-list && cd shopping-list

# initialize a Spring Boot project - we'll be using the Spring Boot CLI
# this will create a folder named backend containing the Spring Boot Maven project
spring init -a shopping-list-backend -g com.example -d=web,h2,data-jpa --description "shopping list backend powered by spring boot" -n shopping-list-backend backend
{% endhighlight %}

Now it is time to initialize the GH repository, we'll be doing this from the command line too (here comes _hub_ into play).

{% highlight sh%}
pwd
<your-project-location>/shopping-list
# initialize a git repository and commit the current state of the project
git init
git add .
git commit -m "initial commit"

# use hub to create a private GH repository named shopping-list-app
# this command will also open the GH web page of the repository in question
hub create -po -d "shopping list app" shopping-list-app

# push the project to GitHub
git push -u origin master
{% endhighlight %}

If everything went fine, we should have now a new project folder, `shopping-list`, containing the `backend` component in which resides a Spring Boot project. The content of the application project is versioned and pushed to a GitHub repository called `shopping-list-app`.

To ascertain that the backend component is so far free of problems we can do a `mvn clean verify` inside the `backend` folder. 

The GitHub repository for this project can be found at this [link].

## Final words
Having done all the above gives us the grounds on which to further build our application.
There are still some technical points to be addressed, before actually starting with the implementation, like hooking the project up to a SonarQube Server and defining a set of quality constraints.

All of these will be addressed in a new post, so stay tuned!

[tmux]: https://github.com/tmux
[Fish]: https://fishshell.com/
[Spring Boot CLI]: https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-cli.html
[hub]: https://hub.github.com/
[link]: https://github.com/vladflore/shopping-list-app
