class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
    # @prototypes = Prototype.includes(:user)
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

    def show
      # @prototype = Prototype.find(params[:id])
      # @prototype = Prototype.find(params[:prototype.id])
      # @prototype = Prototype.find(params[:prototype_id])
      # @prototype = Prototype.find(params[:prototypes.id])
      # @prototype = Prototype.find(params[:prototypes_id])
      user = User.find(params[:id])
      @prototypes = user.prototypes
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
