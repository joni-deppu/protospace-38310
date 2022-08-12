class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
  end
    
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new 
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
      # edit画面にはいくけど空欄　元々edit画面が空欄だったからだと思われる
      #　普通にダメだった。とりあえず、後で修正するとして、editは仮置き
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path        
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
