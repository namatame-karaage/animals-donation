class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
    if @animal.save
      redirect_to animal_path(@animal) , notice: '投稿に成功'
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    if @animal.user != current_user
      redirect_to animals_path, alert: 'ダメ絶対！エラー'
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animal_path(@animal),notice:'更新に成功'
    else
      render :edit
    end
  end

  def delete
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end
  private
  def animal_params
    params.require(:animal).permit(:title, :body, :image)
  end
end
