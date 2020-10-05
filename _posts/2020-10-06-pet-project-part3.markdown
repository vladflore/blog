---
layout: post
title: Pet Project (3/)
permalink: /pet-project-part3
author: Vlad
---
This is **part 3** of the **Pet Project series** about building a small web application from scratch.

### The road so far

Check the other posts to see where we are coming from:
* [part 1]
* [part 2]

### The present

After some time off and dealing with other responsibilities, which required my attention, here is a new post on building
a small web application from scratch. With this update we went pretty far on the implementation road, and we are now one step closer
to having a functional backend. Just as a reminder, the application we are building is a shopping list application with the help of which
the user can manage their shopping experience and keep track of items (to buy) by grouping them into lists. 

This is what I've added with this iteration:

* endpoints for handling items and shopping lists:
    * create item
    * get items, either all of them, or only those which contain a given text in their name
    * create shopping list
    * get shopping lists, either all of them, or only those which contain a given text in their name
    * get items belonging to a shopping lists
    * add item to a shopping list
    
You may have noticed, there is no delete operation, this feature will come in the near future, so stay tuned.

* in-memory database, H2, configured to save the database files on the file system (see `application.properties`)
* H2 compliant script, `schema.sql`, which is executed when the app starts and creates the database objects required by the application (a complete wipe takes place beforehand)
* ability to populate the database with real-life data (taken from my own shopping experience) by means of a `CommandLineRunner` bean
* a test script, `requests.sh`, which depicts a real life scenario, for this I actually used the IntelliJ feature `Generate HTTP Request`
to generate the requests and then I packed them all in an executable file

### Technical Implementation aspects

I tried to keep things as simple as possible and to follow good software development practices.
Please note that this is a work in progress and that things _will_ change.
That being said, here is a summary of the development experience and status quo.

I tried to go with a **package by feature** approach for organizing the code, with this approach we have two packages,
which bring the attention to the domain of the application, domain which comprises _items_ and _shopping lists_.
All the _technical pieces_ reside within these two packages, provided it makes sense for them to be there.
By _technical pieces_ I mean **Controllers** (web layer), **Services** (business), **Repositories** (database access), **Models** (domain itself)
and other objects that together contribute to the business logic of the application.

I use `Enum`s to group different related values under the same name, **Data Transfer Objects** (DTOs) to move data between boundaries,
**Mapstruct** to convert one object into another, **Lombok** to get rid of that annoying boilerplate code, **validation** - `javax.validation.*` to insure
data validity, **Jackson** to easily process JSON data. As I am using **Spring Framework** and **Spring Boot**, a huge part of the heavy lifting is done by the framework,
dependency injection, database access and so on.

The diagram below depicts a part of the model(note that it does not include all the objects involved in the business logic):

{% include_relative model.md %}

The code is available on [GitHub].

Happy coding and see you next time!

[part 1]: {{ site.baseurl }}{% post_url 2020-07-06-pet-project-part1 %}
[part 2]: {{ site.baseurl }}{% post_url 2020-07-14-pet-project-part2 %}
[GitHub]: https://github.com/vladflore/shopping-list-app/tree/master/backend/src/main/java/tech/vladflore/sholia
