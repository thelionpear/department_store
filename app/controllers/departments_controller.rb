class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :edit, :destroy]

  def index
    @departments = Department.all 
  end

  def show
  end

  def new
    @department = Department.new
  end

  def edit
  end
  
  def create
    @department = Department.new(department_params)

    if @department.save 
      redirect_to departments_path
    else 
      render :new
    end 
  end 

  def update 
    if @department.update(department_params)
      redirect_to @department 
    else 
      render :edit 
    end 
  end 

  def destroy 
    @department.destroy 
    redirect to departments_path 
  end 

  private 

    def set_department 
      @department = Department.find(params[:department_id])
    end 

    def set_item 
      @item = Item.find(params[:id])
    end 

    def item_params
      params.require(:item).permit(:name, :price, :description, :rating)
    end 

end
