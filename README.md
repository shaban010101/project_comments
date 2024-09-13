# Description
This a simple Rails application using version 7.2.1 which for Projects, it has a page which allows a user to view a project, update it's status, read comments, add comments and read through the project history

# Instructions on installing
1. The project requires ruby version 3.2.2 to be installed on your machine
2. To install the gems run `bundle install`
3. Setup the database by running `rake db:setup` which will run the migrations and also adds the test data
4. Run the tests using rspec using `bundle exec rspec`
5. To run the application  `bundle exec rails c`

## Questions and Answers
Any limits on who can comment on a project?
Yes, only people who can view the projects

Which platforms will this page be shown on?
Desktop and Mobile

How deep should the comments go?
2 depths deep of comments

How should comments be sorted?
The newest comments should go first

What statuses are supported for projects?
Ready, In progress and Complete

What kind of content can go into comments, code, links, quotes, attachments etc?
Basic text for now however more complex in the future

Should we send a notification on a new comment via Email or Mobile notification?
This would be a feature we add in the future

Initial project status?
Ready

When someone comments what should appear on the comment?
The comment and the persons name

## Endpoints

`GET projects/:id`
Shows the project, comments and change history and allows changing the project status and adding new comments

`PUT projects/:id`
Updates the project status and also adds a new project history entry

`POST projects/:id/comment/new/`
Creates new comments and also adds a new project history entry

## Data model
I opted to have the following tables using SQLite as the database

##### Projects

| Name   | Description         | Data  |
|--------|---------------------|-------|
| id     | ID field of table   | Primary key |
| name   | Name of the project | String|
| status | Status of project   | String|

#### Comments

| Name    | Description                      | Data  |
|---------|----------------------------------|-------|
| id      | ID field of table                | Primary key |
| comment | Comment                          | String|
| commentor | Name of the person who commented | String|
| project_id | Associated Project ID            | Foreign Key|

#### Project History

| Name       | Description                                 | Data  |
|------------|---------------------------------------------|-------|
| id         | ID field of table                           | Primary key |
| change     | Description of whats changed in the project | String|
| project_id | Associated Project ID                       | Foreign Key|

## Improvements
1. Styling by using bootstrap
2. Adding a user in place of commentor, so comments are associated to a specific user on the system and 
also access control can be applied to the projects on a need to know basis
3. Paginating comments and project history so not all are retrieved at once
4. Caching comments and project history so database is not hit all the time for comments
5. Indexing comments and project history to speed up reads
6. Deeper comments, perhaps theres a gem I can use
7. Desktop and mobile support
8. Viewing individual comments
9. Using a more robust database
10. Using an Audit gem like https://github.com/public-activity/public_activity for the project history
