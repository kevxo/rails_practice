class ParentChildController < ApplicationController
  def index
    @kids = Child.where(parent_id: params[:parent_id])
  end
end