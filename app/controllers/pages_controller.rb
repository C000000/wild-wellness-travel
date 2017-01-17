class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def landing
  end

  def home
  end

  def blog
  end

  def about
  end
end
