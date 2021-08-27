class ParentsController < ApplicationController
  def index
    @parents = if params[:keyword]
                 Parent.where('name LIKE ?', "%#{params[:keyword]}%")
               else
                 Parent.order(:created_at)
               end
  end

  def new; end

  def create
    parent = Parent.new(parent_params)
    parent.save

    redirect_to(parents_path)
  end

  def show
    @parent = Parent.find(params[:id])
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def update
    parent = Parent.find(params[:id])

    parent.update(parent_params)
    parent.save

    redirect_to(parent_path)
  end

  def destroy
    parent = Parent.find(params[:id])
    parent.destroy

    redirect_to(parents_path)
  end

  private

  def parent_params
    params.permit(:name, :age, :married)
  end
end
