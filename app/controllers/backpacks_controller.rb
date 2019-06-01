class BackpacksController < ApplicationController
  before_action :set_backpack,
                only: %i[show edit update destroy add_item new_item_form]

  def new_item_form; end

  def add_item
    item = Item.find(params[:item_id])
    @backpack.validates_availability_for(item)
    if @backpack.errors.empty?
      @backpack.add(item)
      redirect_to @backpack
    else
      render :new_item_form
    end
  end

  def index
    @backpacks = Backpack.all
  end

  def show; end

  def new
    @backpack = Backpack.new
  end

  def edit; end

  def create
    @backpack = Backpack.new(backpack_params)
    if @backpack.save
      redirect_to @backpack, notice: 'Backpack was successfully created.'
    else
      render :new
    end
  end

  def update
    if @backpack.update(backpack_params)
      redirect_to @backpack, notice: 'Backpack was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @backpack.destroy
    redirect_to backpacks_url, notice: 'Backpack was successfully destroyed.'
  end

  private

  def set_backpack
    @backpack = Backpack.find(params[:id])
  end

  def backpack_params
    params.require(:backpack).permit(:capacity, :weight_limit)
  end
end
