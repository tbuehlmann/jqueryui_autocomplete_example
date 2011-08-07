# JQueryUI Autocomplete Example
This is a simple input field auto completion example for Rails 3 using the [JQueryUI Autocomplete](http://jqueryui.com/demos/autocomplete/#remote "JQueryUI Autocomplete") plugin.

## Installation
    $ bundle install
    $ rake db:migrate
    $ rake db:seed
    $ rails server

## Usage
Go to the root page of the application and type `s` to the search field.

### Note
You might experience routing errors like `ActionController::RoutingError (No route matches [GET] "/assets/images/ui-bg_inset-hard_100_fcfdfd_1x100.png")`, that's a Rails 3.1.0rc5 bug.

