App links: https://moodtracker-api.herokuapp.com/ | https://git.heroku.com/moodtracker-api.git

# Read Me

### Goals
- Build a SPA w/user authentication that interacts with your own api
- use CRUD in a SQL database
- create user stories & wireframes
- present work to a technical audience (5-10 min)

### Requirements

- Deploy client on GH pages, server on Heroku, host on public GitHub page
- Frequent/cohesive commits from first day onward (atleast 1 per day)
- 2 Github repos (front & back), pin both, complete description & website fields
  - include links to eachother (w/explanation) & the deployed sites
  - technologies used
  - unsolved problems
  - development process/problem solving
    - wireframes/userstories (front end)
    - ERD (back end)

### Specifications

- (AUTH) Sign Up/In/Out, Change Password
- (CLIENT) JS app w/API (renders data retrieved in browser)
  - use jQuery for DOM/events
  - use Handlebars for view rendering
  - CRUD actions, must only be available to signed in user
- (API) create 4+ RESTful routes (GET, POST, PUT/PATCH, DELETE)
  - use Rails & Postgresql
  - have at least 1 resource with relationship to user
- actions only available to (and "owned" by) the signed in user
- feedback & clear forms upon action success/failure

### Big No-Nos

- Delete everything/start over
- Rely on page refresh
- Have any user-facing bugs
- Display non-functional/non-sensible buttons
- use alerts or log *anything* to the console

### Timetable

* Generate resources, check migrations
* Write curl scripts
* Write specs, use spects to write...
  - models
  - controllers
  - serializers
* Test with curl scripts
* add/check relationships b/w resources
* make resource controller Protected (or OpenRead?)
  - add user ownership to resource controller
* write jquery/ajax code for api requests, test w/curl
  - authentication
  - resource CRUD
* write event handlers, add navigation events
* work on styling/final touches
* try for stretch goals
  - data visualization/analysis modal?
  - entry log in calendar form?
