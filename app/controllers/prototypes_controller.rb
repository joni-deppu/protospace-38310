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
  end

    def show
      @prototype = Prototype.find(params[:id])
      # @prototype = Prototype.find(params[:prototype.id])
      # @prototype = Prototype.find(params[:prototype_id])
      # @prototype = Prototype.find(params[:prototypes.id])
      # @prototype = Prototype.find(params[:prototypes_id])
      # user = User.find(params[:id])
      # @prototypes = user.prototypes
    end

    def edit
      @prototype = Prototype.find(params[:id])
    end

    def update
      prototype = Prototype.find(params[:id])
      if prototype.update(prototype_params)
        redirect_to root_path
      else
        render :edit
        # edit画面にはいくけど空欄　元々edit画面が空欄だったからだと思われる
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
