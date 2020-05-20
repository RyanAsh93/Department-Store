class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
      @item = Item.all
    end
  
    def show
      @item = Item.find(params:[id])
    end
   
    def create
      @item = Item.new(departments_params)
      
      if @item.save
        redirect_to items_path
      else 
        render :new
      end 
    end
  
    def new
      @item = Item.new
    end
  
    def edit
      @item = Item.find(params[:id])
    end
    
    def update
      @item = Item.find(params[:id])
  
      if @item.update(items_params)
        redirect_to items_path
      else 
        render :edit
      end 
    end
    
  
    def destroy
      @item = Item.find(params:[id])
      @item.destroy
      redirect_to items_path
    end
  
    private

    def set_department
      @department = Department.find(params[:department_id])
    end
    
    def items_params
      params.require(:item).permit(:name, :price)
    end
  end
  
end
