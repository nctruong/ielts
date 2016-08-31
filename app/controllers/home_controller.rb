class HomeController < ApplicationController
  #before_filter :authenticate_user!
  #before_action :authenticate_use!
  #before_action :authenticate_user!
  before_action :authenticate_student!

  def show
    puts "gotcha"
  end
end
