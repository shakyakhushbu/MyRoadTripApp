# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

gem 'devise'
rails g devise user




add a controller home index
then add alyout to apllication.html.erb using bootstrap
add style.css

add devise gem
rails generate devise:install

add = config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
rails g devise user

add gem letter-opener

rails g devise:views users
rails g devise:controllers users

add role integer migration 
then create role enum


rails g devise:views admins
rails g devise:controllers admins
rails g devise admins

<!-- <div>
    <%= select_tag "Destination", options_from_collection_for_select(Destination.all, :id, :city_name) %>
  </div> -->

   <%= select_tag "Destination", options_from_collection_for_select(Destination.all, :destination_trips, :city_name) %>

   <%= select_tag "Destination", options_from_collection_for_select(Destination.all, :id, :city_name) %>


   <%= a.destination_trips.last.destination.city_name %>

   <td><%= @trip.destination_trips.find_by(:destination_id).destination.city_name %></td>