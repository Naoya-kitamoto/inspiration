class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
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
      params.require(:idea).permit(:title, :subject,:category_id).merge(user_id: current_user.id)
    end
end
