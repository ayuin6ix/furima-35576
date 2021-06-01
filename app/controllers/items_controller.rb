class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :back_user, only: [:update, :edit]
  

  def index
    @items = Item.all.order('created_at DESC')
    
  end
 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  


  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :shipping_cost_id, :shipping_day_id,
                                 :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def back_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end 
    


end


