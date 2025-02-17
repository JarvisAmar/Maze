Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'   # controller action
end


# This block is where you define the routes for your Rails application.
# The routes method is called on the Rails.application object, and within the block, you specify the various routes that your application will respond to.
# get 'home/index':

# This line defines a route that maps a GET request to the URL /home/index to the index action of the HomeController. 
# In other words, when a user navigates to http://yourdomain.com/home/index, Rails will invoke the index action in the HomeController.
# root 'home#index':

# This line sets the root route of your application. 
# The root route is the default route that is used when a user navigates to the base URL of your application (e.g., http://yourdomain.com). 
# In this case, it maps the root URL to the index action of the HomeController.

# Summary
# The get 'home/index' route maps the URL /home/index to the index action of the HomeController.
# The root 'home#index' route sets the root URL of the application to the index action of the HomeController.
# This setup means that when users visit the base URL of your application,
#  they will be directed to the index action of the HomeController,
#  and they can also explicitly visit /home/index to reach the same action.
