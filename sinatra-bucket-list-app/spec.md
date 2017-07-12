# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- I used Sinatra to build this app with the Sinatra gem.
- [x] Use ActiveRecord for storing information in a database -- I used the ActiveRecord gem to store the data for this project.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) -- My project consists of two models, the User model and the LifeGoal model.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) -- In my project, a User has many Life Goals and a Life Goal belongs to a User.
- [x] Include user accounts -- There are user accounts in my project. Users can signup, login, logout, and create/view/edit/delete life goals for their bucket list.
- [x] Ensure that users can't modify content created by other users -- I verify that the user is logged in and they can only access their own content. I verify the session's user id has the same id as the information the user is trying to get access to. If it is a different id, the user will not be able to access that route and they will be redirected to their own content.
- [x] Include user input validations -- I have various input validations in the user and lifegoal models that correspond to signup and creating a new life goal.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) -- Flash messages are used to display if there was an error in creating a user account and in creating a new life goal.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code -- Added all of the required components in my README.

Confirm
- [x] You have a large number of small Git commits -- I committed my code after a made small amount of related changes.
- [x] Your commit messages are meaningful -- My commit messages summarize the changes I committed.
- [x] You made the changes in a commit that relate to the commit message -- My commit changes are all related to the commit message.
- [x] You don't include changes in a commit that aren't related to the commit message -- My commit message is a summary of the changes made. I do not include major changes without mentioning them in the commit message.
