class ChildrensController < ApplicationController
  def index
    @kids = Child.all
  end

  def show
    @kid = Child.find(params[:id])
  end

  def edit
    @kid = Child.find(params[:id])
  end

  def update
    kid = Child.find(params[:id])

    kid.update(child_params)
    kid.save

    redirect_to(children_path)
  end

  private

  def child_params
    params.permit(:name, :age)
  end
end