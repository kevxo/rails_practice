class ChildrensController < ApplicationController
  def index
    @kids = Child.all
  end
end