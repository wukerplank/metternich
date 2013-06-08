class WelcomeController < ApplicationController
  
  skip_before_filter :user_required
  
end
