class ParentsController < ApplicationController
  def index
    @parents = Parent.order(:created_at)
  end

  def new
  end

  def create
    parent = Parent.new(parent_params)
    parent.save

    redirect_to('/parents')
  end

  def show
    @parent = Parent.find(params[:id])
  end

  private

  def parent_params
    params.permit(:name, :age, :married)
  end
end