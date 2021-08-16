class ParentsController < ApplicationController
  def index
    @parents = Parent.order(:created_at)
  end

  def new
  end

  def show
    @parent = Parent.find(params[:id])
  end
end