class IdeasController < ApplicationController
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
  
    private

    def idea_params
      params.require(:idea).permit(:title, :category_id, :subject, :image).merge(user_id: current_user.id)
    end
end
