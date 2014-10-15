class WelcomeController < ApplicationController
  skip_before_action :authorize	
  def index
  end

  def contact
  end

  def aboutUs
  end
end
