# README

## Description
A web application named "Event Feedback Hub", where users can share their feedback on events they attended (workshops, webinars, conferences), and view others' feedback in real-time.

**Features**

* A submission form. Users can select an event from a dropdown menu, and submit their feedback along with a 1-5 starts rating.

* A feedback stream. This is a real-time list of feedback shared by users about available events.
	* For each entry has the event name, the user's feedback text, and the rating given.
	* Has pagination and filtering on event name and rating.

## Built with
* Ruby 3.4.5
* Rails 8.0.2

## How to run locally

* You must have Ruby 3.4.5 installed

* In your terminal:
    * git clone git@github.com:dennis-every/EventFeedbackHub.git
    * cd EventFeedbackHub
    * bundle install
    * bin/rails db:migrate
    * bin/rails db:seed
    * bin/dev

* In your web browser:
    * Visit localhost:3000