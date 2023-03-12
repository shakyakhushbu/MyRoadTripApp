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

   a.bookings.pluck(:user_id)


   <li class="nav-item">
        <% if user_signed_in? %>

        <%# <li class="nav-link"> %>

          <%#= link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete}, class: 'nav-link' %>
             <li class="nav-item">
          <%= link_to "Bookings", bookings_path,class: 'nav-link' %>
          </li>
        </li>
          <%if current_user.admin? %>
           <li class="nav-item">
          <%= link_to "Trips", admins_path,class: 'nav-link' %>
          </li>
          <!-- <li class="nav-item">
          <%#= link_to "UserBookings", user_bookings_path,class: 'nav-link' %>
          </li> -->
          <%# else %>
           <!-- <li class="nav-item">
          <%#= link_to "Bookings", bookings_path,class: 'nav-link' %>
          </li> -->


          <% end %>
           <li class="nav-item">
          <%= link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete}, class: 'nav-link' %>
        </li>
          <li class="nav-item">
          <%= current_user.first_name %>
          </li>
        <% else %>
            <li class="nav-item">
              <%= link_to 'Sign Up', new_user_registration_path,class: 'nav-link' %>
            </li>
            <li class="nav-item">
            <%= link_to 'Login', new_user_session_path,class: 'nav-link' %>
            </li>
        <% end %>
        </li>
