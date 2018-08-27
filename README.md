## JPACRUD Project

### Description
This project was modeled after RPG games as a very rudimentary full-stack web project. The user is able to see the homepage with abilities to list out RPG games in the database. This option retrieves a list of RPG games to display to the index page. The index is a .jsp file, which allows different controller routes to utilize the same page. As a result, when the list is displayed the user has options to see the details, edit, or delete a particular RPG from the database. Each action has corresponding controller routes. Editing a file updates that RPG in the database. Deleting deletes the RPG. Clicking the details button will take the user to a separate details.jsp page which allows them to see more information about the RPG. Furthermore, this page also has functionality to edit and delete the particular RPG.

Much of the heavy lifting for the project is done through the Spring framework. The project has many dependencies which are imported through Gradle and the Maven repository. In particular, JPA and hibernate dependencies allow for streamlined managing of data-accessor-objects, in this case, just the RPGDAOImpl class. Dependency injections are done through Spring beans in configuration files. These include creating an entity manager factory and usage of some other annotations to allow simple queries to the database.

### Skill Distillery Week 8 Homework
This project was assigned after Week 8 of Skill Distillery's Java Coding
School.

#### Technologies Used

* Java
* mySQL, mySQL workbench
* JDBC API methods via java.sql
* JSQL
* EER Diagrams
* Gradle
* Spring Tool Suite IDE
* Spring Framework
* Spring MVC
* HTML/CSS
* Apache Tomcat Server
* JPA

#### Lessons Learned

* JPA methods to query a database - mostly finding particular RPGs in the database and pulling them out via an id field, creating a model of that RPG as an object and being able to manipulate the object from that point.
* Setting up configurations in Gradle for dependencies required for JPA, such as validation and hibernate
* flashAttributes() and ModelAndView objects to redirect a POST to GET request url mapping in a controller class.
* Advanced validation tactics for forms on a jsp page utilizing the form tag library. This allows annotations that Spring recognizes so that controller handling methods can recognize incorrect input and refresh the page, letting the user know to enter the correct values
* Cleaning projects/server and cleaning work directories to clear cache, allowing Tomcat Apache server to run appropriately due to changes made in project
* Adding Spring and Gradle nature to a dynamic web project in STS. Configuring a Spring project, especially setting up appropriate beans/dependencies, dispatcher servlet, component scans (in the -servlet.xml file), etc.
