class ChildrensController < ApplicationController
  def index
    @kids = Child.all
  end

  def show
    @kid = Child.find(params[:id])
  end
end