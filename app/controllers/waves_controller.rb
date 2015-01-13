class WavesController < ApplicationController
  before_action do
    if session[:user_id].present?
    else
      redirect_to sign_in_path
    end

    def current_user
      @current_user = User.find session[:user_id]
    end
  end


  def index
    waves = Wave.all
    @users = User.all
    @waves = current_user.waves.order("created_at desc")
    @wave = Wave.new
    @allwaves = Wave.all.order("created_at desc")
    @followings = Following.all
  end

  def post
    @post = Wave.new(params.require(:wave).permit(:post))
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end
end
