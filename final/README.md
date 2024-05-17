# Final Report

This is the README for Group 4, Project 6 in which we created a web application to streamline collection, collation, and analysis of audience surveys for presentations.

SQLite was used to store the models generated into a local database.

Users can create an account from the home page or log in if they are an existing user, and can sign out at any point in the application. The links for these features are in the navigation bar at the top of every view, but the signup/signin and signout links are removed when the user is signed in and out, respectively. The Devise gem was used to help implement these features.

In the user view, upon login the user is brought to the Home page. Here, the surveys in which they can complete are listed as a to-do list. Also, a side bar on the left displays the users current teams they are a part of and the links to each team's info page. The user also has a Presentations tab, which when visited will display each team currently in the database and each of their presentations. The user can take surveys on presentations here, view which surveys they have completed, and view the feedback for the presentations that they were a part of. Users are restricted to one submission per survey, and cannot evaluate on a presentation that they were a part of (presentations that belong to teams they are on). The user is unable to edit their responses; surveys are final on submission.


In the administrator view, the Home page is simply a welcome message to the admin, as they belong to no teams and do not complete surveys. The admin has a Teams tab, which when visited displays each team and its members. The admin can create new teams, add and remove members, and delete teams. Upon deletion, each TeamMember model connecting users to the team are deleted as well. In the presentations tab, the view is similar to that of the user, but now the admin can create presentations, delete them, and view the feedback for a given presentation. When a presentation is deleted, all of the surveys taken for that presentation are deleted as well. The Surveys tab lists every user currently in the database and each of the surveys they have completed. The admin can view the full results of each feedback, as well as easily see how many submissions a user has, allowing for easy assessment of the users. The Add to Team tab is where members are added to a team. The admin must select the team and the user from a dropdown selection menu.

There is some information necessary to get the application up and running:
It is necessary to use Ruby version: 2.6.6, Rails version 6.0.3. It is also necessary to install the Devise gem in order to properly use the authentication features of the website. The application then uses Devise to authenticate users and administrators with a password. For configuration, the routes.rb file contains routes that instantiate the controllers and map the database operations to the necessary HTTP requests for the view of the site. The databases are intialized when the application is deployed. When new users, presentations, and evaluations are created, the respective databases are updated so that they can be shown in the view. 

# Program Execution

Download the most recent version of the software into a Ruby 2.6.6 Rails 6.0.3 environment.

In the /project6 directory, begin by calling

    bundle install

to install and update the necessary gems for the project listed in the Gemfile.

Run 
    yarn install --check-files
to install all dependencies for the project

Next, initialize the databases by entering the command

    rake db:migrate

To populate the databases with users, teams, presentations, and surveys to test the application, run
    
    rake db:seed

An admin account is generated here, but instructions to create your own admin account are given later in this document.

Finally, to run the application, enter

    rails server

and go to the local server address at http://localhost:3000 in a browser. You can now begin using the application by creating a new user account. Whenever you are finished, you can shut down the server by entering CTRL-C into the terminal the server is running on. 

The Devise gem is already in the Gemfile and the configuration is complete, but if needed, the reinstallation instructions are on the Devise GitHub: https://github.com/heartcombo/devise 

IMPORTANT: There is no current feature in the application that allows for creation of admin accounts. The user has a boolean attribute "admin" that, when set to true, gives the user administrative privileges. To make an admin, first make a standard user account using the application. Then, shutdown the server and enter the rails console by entering

    rails console

into the command line in a terminal. Next, load your user by entering the command

    x = User.first

Update the "admin" column

    x.admin = true

Then save

    x.save

You can leave the Rails console by entering the command "quit".
Your user account now has admin privileges.

If you chose to use the seed file to populate the database, the admin account is given as admin@admin.com with password "password". If you want to see the user view, there are 8 users given as user#@email.com with password "password." If you want full details on what all is generated, go look in the seed file. However, each element generated can be found using the application itself. The purpose of the seed file was to allow a new user/tester of the software to quickly see and test the different functionalities of the application.

From here, you have full control over the application.

## Notable Extensions
    - a user is not allowed to self evaluate. The software ensures that the user would never have access to the link to take a survey for a presentation that belongs to a team they are currently on, but there is also a validation in place to ensure the survey will not be saved in the case that the user belongs on its team.

    - a button labeled "Virtual Presentation" on the survey from will, when clicked, automatically fill in the "Delivery" section of the survey as "Not Applicable" (since those questions don't apply to a Zoom presentation). This was implemented using Javascript

    - (added after initial version) users can now see feedback given for presentations that they were a part of. The admin can still see all of the surveys given, but also can see what user submitted the survey.

    - the admin can view the roster in the Surveys tab, which also displays the surveys submitted by each user and a link to view each submission

    - users can be assigned to more than one team without conflict, and teams can also have multiple presentations without conflict.

