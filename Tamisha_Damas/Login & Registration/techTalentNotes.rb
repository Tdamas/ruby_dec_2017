# To start a new rails projects
$ vagrant up
$ vagrant ssh

sudo su postgres -c psql # access the postgres shell -- ALREADY INSTALL
CREATE ROLE vagrant SUPERUSER LOGIN; # create a user -- ALREADY INSTALL
\q # exiting the shell

$ cd /vagrant # Run the ls command to make sure your in the folder that the vagrantfile resides
$ rails new Login_Registration --database=postgresql -T
# open Login_Registration in your text editor. Go to config, database.yml and you will find postgresql
--------------------------------------   Gemfile   ------------------------------------
# Gem 'pg' is already unlock in your gemfile
# unlock 'brypt' which is a password hashing function
# gem 'hirb' -- add this one. It improves console output by providing a smart pager and auto-formatting output
group :developement, :test do
  gem 'rspec-rails' # testing tool for Behavior Driven Development
end
$ cd Login_Registration
$ bundle install # To install your gems
$ rails generate rspec:install
$ rake db:create  # to create your database
$ rails console   # Or rails c  to access your database you can also access the database directly by using $ rails db
$ Hirb.enable   # to activate hirb
$ rails s -b 0.0.0.0  # To start your server ctrl+c to stop the server

-------------------------------------     Bcrypt      -----------------------------------
$ rails g model User first_name:string last_name:string alias:string email:string age:integer password:digest
# Model name must be capitalized the password:digest will create the password field and password confirmation.
# before running you migrations go to
-db
  -migrate
    - click on the user model to make sure spelling and fields are correct
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :alias
      t.string :email
      t.integer :age
      t.string :password_digest

      t.timestamps
    end
  end
end
$ rake db:migrate

# go to
-app
  -model
    -usr.rb

class User < ApplicationRecord
  has_secure_password
end

# has_secure_password give us the following functionality
password required only on create not on update
password length should be less than or equal to 72 characters
Confirmation of password (using a password_confirmation attribute)
# Even though the columns aren't present in our database BCrypt adds the following attributes to our User instance.
password: We can update our password by manipulating this attribute and saving.
password_confirmation: This field must match our password field.

--------------------------------  Adding Validations  -------------------------------
class User < ActiveRecord::Base or ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :alias, presence: true, length: { in: 2..20 }
  validates :age, numericality: { greater_than_or_equal_to: 10, less_than: 115 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end

http://guides.rubyonrails.org/active_record_validations.html

# in the rails console we will check Validations
$ rails c # or rails console
> Hirb.enable
> User.all
> user = user.new
> user.valid? # false
> user.save # false
> user.errors # it will list all your validation errors.
> user.errors.full_messages
> User.create(first_name: 'Jane', last_name: 'Doe', alias: 'Jane', email: 'jane@doe.com', age: '18', password: 'password', password_confirmation: 'password')
> User.save
# if you make any changes to your model your have to tell the console to reload to observe the changes
> reload!

------------------------------------   Routes   ---------------------------------------
# /config/routes.rb
A page that displays all the products.	                                               /products	        products#index	GET
A page that allows the user to add a new product	                                     /products/new	    products#new	GET
A URL that processes information submitted from the new page to create a product	     /products	        products#create	POST
A page that displays information for the product with an id of 2	                     /products/2	      products#show	GET
A page that allows the user to edit existing product information	                     /products/2/edit	  products#edit	GET
A URL that processes information submitted from the edit page to update a product	     /products/2	      products#update	PATCH/PUT
A URL that allows a product to be deleted	                                             /products/2	      products#destroy	DELETE
# our routes file determines which controller and method should be executed, it is up to the controller to make sense
# of the request and produce the appropriate output. In Rails, we will write most of our logic in our models, and use the controller for control flow.

#If you know what specific methods you want in the controller, you can enter them on the command line as well and those methods will be
# automatically defined in the controller file that is generated. Controller names are capitalized and plural.
$ rails generate controller Users new create show
# it is best to keep a separate controller for SessionsController
$ rails g controller Sessions new create destroy# This will create view files, but lets delete them.
# app/controllers/users_controller.rb
# This is where you will write your logic.
class Users_controller < ApplicationController
  def new
    # renders the new.html.erb view in the views/users folder
  end

  def create
    # renders the create.html.erb view in the views/users folder
  end

  def show
    # renders the show.html.erb view in the views/users folder
  end
end

# If you go to config/routes you will see the routes that have been created for you
# we will be using named routes
Rails.application.routes.draw do
  get   'users/new'         =>    'users#new'
  # we can change users/new to 'register'
  post  'users/create'      =>    'users#create'

  get   'users/show'        =>    'users#show'

end
# This will render the coresponding HTML pages from app/views/users/new.html.erb

-------------------------     Creating Registration Page     ----------------------------
# Lets go to bootstrap 4 and click on new version and we will be using the cdn
# copy the the script tags and past them in app/views/layouts/application.html.erb
# put them under the javascript tags. Should look like this:
<!DOCTYPE html>
<html>
  <head>
    <title>LoginRegistration</title>
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
    <%= csrf_meta_tags %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="container"> #Don't forget to add this div container with the yield in between

      <%= yield %>
    </div>
  </body>
</html>

--------------------------    Register HTML    -----------------------------
# go to new.html.erb and start building out your registration page
go to bootstrap Documentation, click on components, click on form, copy and paste:
# <div class="form-group">
#     <label for="exampleInputEmail1">Email address</label>
#     <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
#     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
# </div>

# <div class="row">
#   <div class="col-md-12">
#     <h1>Register</h1>
#   </div>
# </div>
#
# <div class="row">
#   <div class="col-md-2"></div>
#   <div class="col-md-10">
#     <form action="" method="post" class="form">
#
#     <!-- First Name -->
#       <div class="form-group">
#         <label for="first_name">First Name</label>
#         <input type="text" class="form-control" id="first_name" aria-describedby="firstnameHelp" placeholder="Enter First Name">
#       </div>
#   </div>
# </div>

# Clean it up to look like this:
<div class="row">
  <div class="col-md-12">
    <h1>Register</h1>
  </div>
</div>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-10">
    <form action="" method="post" class="form">

      <!-- First Name -->
      <div class="form-group">
        <input type="text" name="user[first_name]" class="form-control" id="first_name" placeholder="Enter First Name">
      </div>

      <!-- Last Name -->
      <div class="form-group">
        <input type="text" name="user[last_name]" class="form-control" id="last_name" placeholder="Enter Last Name">
      </div>

      <!-- Alias -->
      <div class="form-group">
        <input type="text" name="user[alias]" class="form-control" id="alias" placeholder="Enter Alias">
      </div>

      <!-- Email -->
      <div class="form-group">
        <input type="text" name="user[email]" class="form-control" id="email" placeholder="Enter Email">
      </div>

      <!-- Age -->
      <div class="form-group">
        <input type="text" name="user[age]" class="form-control" id="age" placeholder="Enter Age">
      </div>

      <!-- Password -->
      <div class="form-group">
        <input type="text" name="user[password]" class="form-control" id="password" placeholder="Enter Your Password">
      </div>

      <!-- Password Confirmation -->
      <div class="form-group">
        <input type="text" name="user[password_confirmation]" class="form-control" id="password_confirmation" placeholder="Enter Your Password Again">
      </div>
    </form>
  </div>
  </div class="col-md-2">
</div>

# Since we are using bcrypt, remember that it uses password digest to check to see if it matches our password confirmation. But it
# will only do that if the name attribute on our input is password_confirmation. We will be using whitelisted parameters
# http://edgeguides.rubyonrails.org/action_controller_overview.html
# Add submit button
<!-- Submit -->
<div class="form-group">
  <button class="btn btn-primary" type="submit">Register</button>
</div>

# Now that we finished our form we need it to submit to /register to take us to the create method to create the user.
# Click register and notice the error message. We forgot to add our csrf token. Add this line to create :
<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

<div class="row">
  <div class="col-md-12">
    <h1>Register</h1>
  </div>
</div>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-10">
    <form action="" method="post" class="form">
    <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

      <!-- First Name -->
      <div class="form-group">
        <input type="text" name="user[first_name]" class="form-control" id="first_name" placeholder="Enter First Name">
      </div>

      <!-- Last Name -->
      <div class="form-group">
        <input type="text" name="user[last_name]" class="form-control" id="last_name" placeholder="Enter Last Name">
      </div>

      <!-- Alias -->
      <div class="form-group">
        <input type="text" name="user[alias]" class="form-control" id="alias" placeholder="Enter Alias">
      </div>

      <!-- Email -->
      <div class="form-group">
        <input type="text" name="user[email]" class="form-control" id="email" placeholder="Enter Email">
      </div>

      <!-- Age -->
      <div class="form-group">
        <input type="text" name="user[age]" class="form-control" id="age" placeholder="Enter Age">
      </div>

      <!-- Password -->
      <div class="form-group">
        <input type="text" name="user[password]" class="form-control" id="password" placeholder="Enter Your Password">
      </div>

      <!-- Password Confirmation -->
      <div class="form-group">
        <input type="text" name="user[password_confirmation]" class="form-control" id="password_confirmation" placeholder="Enter Your Password Again">
      </div>

      <!-- Submit -->
      <div class="form-group">
        <button class="btn btn-primary" type="submit">Register</button>
      </div>

    </form>
  </div>
  </div class="col-md-2">
</div>

# now if we enter a user and click register it will take us to the create.html. we need to work on our create method to
# create our user. But we will do this using strong parameters by creating a private method
# app/controllers/users_controller
private #private does not need an end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :alias, :age, :email, :password, :password_confirmation)

# params is the key that we use to access the parameters in our form with the user key and permit these fields.
# so now we should be able to create our user by saying user = User.create(user_params) using those user's params
def create
  user = User.create(user_params)
end
# Next we need to see if the user is valid. If the user is valid we want to save them into session and direct them to the show page
def create
  user = User.create(user_params)
  if user.valid?
    session[:user_id] = user.id
    # session key named :user_id will equal user.id
    return redirect_to user_path user.id
  end
end

# Now if the user is not valid we want to flash some errors and redirect them back to the registration page
def create
  user = User.create(user_params)
  if user.valid?
    session[:user_id] = user.id
    # session key named :user_id will equal user.id
    return redirect_to user_path user.id
  end

  return redirect_to :back
end

------------------------------- Flash Errors ----------------------------------
# We can add our flash error messages in our applications layout so we do not have to write our error messages on every page
# <-- Errors -->
# <% if flash[:errors] %>
#   <% flash[:errors].each do |error| %>
#     <p class="text-danger"><%= error %></p>
#   <% end %>
# <% end %>
#
# <%= yield %>

def create
  user = User.create(user_params)
  if user.valid?
    session[:user_id] = user.id
    # session key named :user_id will equal user.id
    return redirect_to user_path user.id
  end

  flash[:errors] =user.errors.full_messages
  return redirect_to :back

end

# now we want for the user to land on the show page with a personalized greeting
def show
  @user = User.find(params[:user_id])
end

# views/users/show.html.erb
<h1>Welcome <%= @user.alias %></h1>

------------------------ Creating a current_user Method ---------------------------
# let's create a current user method to be used later
# app/controllers/applicationcontroller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Placing current_user method here, makes it available to use in any method.
  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

----------------------- Logout ------------------------
# we want to make it so that if you are logged in the logout button is available to you
# if you are not logged in you have a login or register button available to you
# go back to bootstrap copy the 1st navbar code under Supported content. Paste it above <-- Errors -->
# Check to see what it looks like first. Below are the following adjustments we will need to make
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="<%= root_path %>">Registration</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <% if current_user %>
            <li class="nav-item active">
              <a class="nav-link" href="<%= logout_path %>" data-method="delete">Logout</a>
            </li>
          <% else %>
            <li class="nav-item">
              <a class="nav-link" href="<%= new_register_path %>">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= new_login_path %>">Login</a>
            </li>
          <% end %>
        </ul>
      </div>
    </nav>

  <div class="container">
    <!-- Errors -->
    <% if flash[:errors] %>
      <% flash[:errors].each do |error| %>
        <p class="text-danger"><%= error %></p>
      <% end %>
    <% end %>

    <%= yield %>
  </div>
</body>
</html>

-------------------------------------  Logout  ----------------------------------
# if you notice when we click on logout nothing happens. So we need to create the method that logs out our user.
# To do this we will need to go to our sessions controller, to our destroy method. We do this here because the user is in
# session
def destroy
    #session dot delete this particular user_id if it's equal to the sessions user_id
     session.delete(:user_id) if session[:user_id]
     return redirect_to new_login_path
end
# let's click on our logout button. The error messages is stating that we are missing a template for the logout request.
# let's copy and paste the new.html.erb from user's onto sessions and make the necessary modifications.
<div class="row">
  <div class="col-md-12">
    <h1>Login</h1>
  </div>
</div>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-10">
    <form action="login_path" method="post" class="form">
    <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

      <!-- Email -->
      <div class="form-group">
        <input type="text" name="user[email]" class="form-control" id="email" placeholder="Enter Email">
      </div>

      <!-- Password -->
      <div class="form-group">
        <input type="text" name="user[password]" class="form-control" id="password" placeholder="Enter Your Password">
      </div>

      <!-- Submit -->
      <div class="form-group">
        <button class="btn btn-primary" type="submit">login</button>
      </div>

    </form>
  </div>
  </div class="col-md-2">
</div>

-------------------------------------- Login ----------------------------------------
def create
  # here we will find the user by email using the user key and email key
  user = User.find_by_email(params[:user][:email])

  if user # here is the user exist
    # here match the user's password that they entered against that from the database
    if user.try(:authenticate, params[:user][:password])
      # if password is correct login using that user's session id
      session[:user_id] = user.id
      #redirect them to the show page
        return redirect_to user_path user.id
    end
    # if user exist but password is wrong flashh errors
    flash[:errors] = ['Password is incorrect, please enter again.']
  else
    # If user doesn't exist flash errors
    flash[:errors] = ['Account does not exist, please register.']
  end

  return redirect_to login_path
end
