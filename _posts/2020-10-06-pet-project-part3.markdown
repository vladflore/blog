---
layout: post
title: Pet Project (3/)
permalink: /pet-project-part3
author: Vlad
modified_date: 2020-11-04
---
This is **part 3** of the **Pet Project series** about building a small web application from scratch.

### The road so far

Check the other posts to see where we are coming from:
* [part 1]
* [part 2]

### Status Quo

After some time off and handling some other responsibilities, here is a new post on building
a small web application from scratch. With this update we went pretty far on the implementation road, and we are now one step closer
to having a functional backend. Just as a reminder, the application we are building is a shopping list application with the help of which
the user can manage their shopping experience by keeping track shopping lists and their items. 

This is what we have achieved with this iteration:

#### Endpoints for handling items and shopping lists

Following endpoints are now available(textual description):

* create an item
* get the items, either all of them, or by name
* create a shopping list
* get the shopping lists, either all of them, or by name
* get items belonging to a shopping lists
* add item to a shopping list
    
#### Embedded H2 database

To store the application's data we use for now an [embedded H2 database](https://www.h2database.com/html/cheatSheet.html), configured to save its files on the file system (see `application.properties`).

#### H2 compliant script

`schema.sql`, is a script which is executed when the app starts and creates the database objects required by the application (a complete wipe takes place beforehand).

#### Not so dummy data 

To populate the database with real-life data we use a `CommandLineRunner` bean, which reads a `.csv` file and inserts the data into the database.

#### Test script

`requests.sh` is a test script, which depicts a real life scenario.
I actually used the IntelliJ feature _Generate HTTP Request_ to generate the requests and then I packed them all in an executable file.

#### Java 11 support

The project uses now Java 11 (keeping up with the Java LTS versions).

### Technical implementation aspects

I tried to keep things as simple as possible and to follow good software development practices.

> **_NOTE:_** This is a work in progress and things _will_ definitely change.

That being said, here is a summary of the development experience and status quo.

I went with a _slightly_ different version of **package by feature** approach for organizing the code.
With this approach we have two packages, which bring the attention to the domain of the application.
Each package contains everything related to the _feature_ in question.
The Domain comprises currently _items_ and _shopping lists_.

The constituents of each _feature_ package follow a **layered architecture**.
This dictates that one layer should only communicate with the layer directly below it.
In this case we have something similar to the following diagram:

{% include_relative packages.md %}

I use `Enum`s to group different related values under the same name, **Data Transfer Objects** (DTOs) to move data between boundaries,
**Mapstruct** to convert one object into another, **Lombok** to get rid of that annoying boilerplate code, **validation** using `javax.validation.*` to insure
data validity, **Jackson** to easily process JSON data. As I am using **Spring Framework** and **Spring Boot**, a huge part of the heavy lifting is done by the framework,
which includes dependency injection, database access and so on.

The diagram below depicts a part of the model:

{% include_relative model.md %}

You will be seeing more of this kind of diagrams as the project advances (I created them using [PlantUML] and a [plugin] for IntelliJ and exporting them as .svg).
Think of them as _diagram as code_, which means, one writes some special code, which is then transformed into a .svg or image of even .pdf, code which can be versioned.

Another interesting thing was how to take a peek inside the embedded H2 database from the terminal.
Please note that the database has to be shut down in order to connect to it, we are basically having a look into the database file, which is locked as long as H2 is running.

```sh
java -cp <path-to-h2-jar> org.h2.tools.Shell \
     -url "<h2-connection-string>;ifexists=true" \
     -user "<user>" \
     -password "<password>"
```

where:
* `<path-to-h2-jar>` is something like `/home/vlad/.m2/repository/com/h2database/h2/1.4.200/h2-1.4.200.jar`, in my case I am using maven 
* `<h2-connection-string>`, `<user>`, `<password>` is the information to connect to the H2 database, usually found in the `application.properties` file

After connecting to the database we can query it by running commands like:

```sql
show tables;
select * from item;
```
### Final words

This post is more of a status report, and a bird's-eye view of the current project iteration. We are now at the point where we could start building a fancier kind of client, 
other than some .sh scripts, and send requests to the backend to create and get items and shopping lists. As necessary, the business logic will change to make room to other
features as I discover them from my own shopping experience. There is still a lot of work ahead - new client, a more stable backend, CI/CD process, Infrastructure etc., so stay tuned
for the next update.

The current state of the project is available on [GitHub].

Take care and 'til next time!

[part 1]: {{ site.baseurl }}{% post_url 2020-07-06-pet-project-part1 %}
[part 2]: {{ site.baseurl }}{% post_url 2020-07-14-pet-project-part2 %}
[GitHub]: https://github.com/vladflore/shopping-list-app/tree/master/backend/src/main/java/tech/vladflore/sholia
[PlantUML]: https://plantuml.com/
[plugin]: https://plugins.jetbrains.com/plugin/7017-plantuml-integration
