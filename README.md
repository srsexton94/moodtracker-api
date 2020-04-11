
# MoodTracker

![](./screenshot.png)

## Project Description
A full-stack application (SPA) with a custom, RESTful API.  A tracker application that allows users to sign up for an account and then record how they are feeling alongside a self-rating on how well they are meeting their basic needs.  This information is then used in a number of data visualizations to help theuser notice patterns and trends in their mental ehalth and general well-being.  This is done in aim of aiding users' agency in facilitating their own self care and other mental health considerations as well.

### Project Links
- [Front End Repo](https://github.com/srsexton94/moodtracker-client)
- [Deployed Client URL](https://srsexton94.github.io/moodtracker-client/)
- [Deployed Server URL](https://moodtracker-api.herokuapp.com/)
- [Rails API Template](https://git.generalassemb.ly/ga-wdi-boston/rails-api-template)


## Specifications
* Be a SPA with User Authentication that interacts with a custom API
* use CRUD commands in a SQL database
* Deploy client on GH pages, the server on Heroku, and host on public GitHub page
* Make frequent and cohesive edits throughout the project
* Must provide all authentication actions & 4+ RESTful routes

## Technologies Used in Back End
##### Languages
* Ruby
* SQL

##### Libraries/Frameworks/etc...
* Rails5
* PostgreSQL
* RSpec
* cURL

## Planning and Development
This project was conceived with the idea to produce a mood tracker where users can record how they are feeling and use that information to notice patterns and trends in their mental health and general well-being. This would be in aim of aiding users' agency in facilitating their own self care and possibly other mental health considerations as well.

#### Entity Relationship Diagrams
In the project planning stage, for the back endof this project, an [inital MoodTracker ERD](https://documentcloud.adobe.com/link/track?uri=urn%3Aaaid%3Ascds%3AUS%3A82eb9e85-769c-4066-9a72-4e8d96d2754f) links the user resource to an 'entries' resource (one to many) and then the 'entries' to both a 'needs' and a 'moods' resource.  Given the scope of the project those relationships were scaled down significantly to instead model a single, one-to-many relationship between 'one' User and 'many' Moods.
If the project expands in the future to incorporate the needs resource after all, it is recommended that the User-Mood relationship be maintained while adding another one-to-many relationship between 'one' Mood and 'many' Needs.

#### Problem Solving
In the beginning of this project, in order to approach the task at hand, a rough outline of a possible timetable/progression was laid out:

###### Estimated Timetable

* Generate resources, check migrations
* Write curl scripts
* Write specs, use specs to write...
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

Given its intended flexibility, the outline was not certainly observed exactly. However it did offer significant utility in outlining the various component parts of the project (in actionable 'steps'), and in emphasizing the relationship between them (so that components that were dependent on others were clearly identifiable as such).

This approach proved most useful in encoutnering further problems.  Many of the difficulties presented in this project's completion were greatly benefitted by breaking down a desired outcome into its internal components, considering dependencies in establishing and maintaining data flow, and refactoring so that the components were individually contained.

#### Going Forward...
Upon initial submission, this project concluded at the creation of the moods resource, an entry log of all mood entries, and a single chart visualizing total mood tallies.  At that time future goals were defined as such...

> Ideally this inital project can be expanded in two (or more!) ways.  Firstly, a data visualizaiton component will greatly aid the overall aim of this application; in making overall trends in the input clear to the user.  At this time of initial production, the app is already able to offer one visualization of the total iterances of an input over their labels.  However more detailed visualizations would greatly aid the application.

> Secondly, a primary future goal of this project is to include an additional user input which records a number of self-assesments where users can rate how well they're meeting a number of their basic needs. This information could then be combined with the concurrent mood input to offer more utility to the user, by helping users notice any correlations between their self care and their mood.

> Beyond those two primary expansions, future development endeavors might consider altering the GET index request (and related handlebars template) so that the entry log displays in a more user-friendly format. Perhaps the entry log could also offer some kind of search criteria/user controls to more quickly search through the entry log and identify a particular entry.


It is with a great sense of accomplishment that, as of this publication - each of those future goals has been met.  Furthermore future development goals might include:
* Offering a more interesting/aesthetically pleasing form for the needs submission (initial intention was to present them in stylized range inputs; however browser compatability issues introduced complications beyond the time constraints of this publication)
* Offering a change for users to edit range inputs alongside mood entry updates
* Improve the appearance of the charts to standardize the X and Y axes, include properly formatted titles, and a more appropriately sized legend

This project's current presentation is the product of much effort and pride on the part of the developer and concludes with sincere and plentiful thanks for your time and consideration. All feedback and contributions will be dutifully reviewed and greatly appreciated.
