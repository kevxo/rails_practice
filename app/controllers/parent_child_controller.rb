class ParentChildController < ApplicationController
  def index
    @kids = if params[:sort]
              Child.order(params[:sort])
            elsif params[:filter_age]
              Child.where('age > ?', params[:filter_age])
            else
              Child.where(parent_id: params[:parent_id])
            end
  end

  def new
    @parent = Parent.find(params[:parent_id])
  end

  def create
    child = Child.new(parent_child_params)
    child.save

    redirect_to("/parents/#{params[:parent_id]}/childrens")
  end

  private

  def parent_child_params
    params.permit(:parent_id, :name, :age)
  end
end
