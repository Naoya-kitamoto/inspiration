class IdeasController < ApplicationController
  before_action :move_to_log_in, only: :new
  def index
    @ideas = Idea.includes(:user).all
    @idea = Idea.new
  end

  def new
    @idea = Idea.new
  end

    def create
      @idea = Idea.new(idea_params)
      if @idea.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @idea = Idea.find(params[:id])
    end

    private

    def idea_params
      params.require(:idea).permit(:title, :category_id, :subject, :image).merge(user_id: current_user.id)
    end

    def move_to_log_in
      return if user_signed_in?
  
      redirect_to new_user_session_path
    end

end
