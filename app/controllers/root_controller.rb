class RootController < ApplicationController
  def index
    @people = Person.all
    @projects = Project.all
  end
end
