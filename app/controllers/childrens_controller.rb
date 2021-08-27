class ChildrensController < ApplicationController
  def index
    @kids = if params[:keyword]
              Child.where('name LIKE ?', "%#{params[:keyword]}%")
            else
              Child.where(is_adopted: true)
            end
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

  def destroy
    kid = Child.find(params[:id])
    kid.destroy

    redirect_to(childrens_path)
  end

  private

  def child_params
    params.permit(:name, :age)
  end
end
