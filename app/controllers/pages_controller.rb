class PagesController < ApplicationController
  def dashboard
    @projects = Project.all
  end
end
