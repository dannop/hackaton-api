class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # GET /topics/1/comments
  def comment_index
	@comments = Comment.where(topic_id: params[:topic_id])
	render json: @comments
  end

  # POST /topics/1/comments/1
  def comment_create
	@comment = Comment.new(comment_params)
	if @comment.save 
		render json: @comment
	else
		render json: @comment.errors
	end
  end

  # POST /topics/1/comments/1/DELETE
  def comment_delete
	@comment = Comment.new(comment_params)
	@topic = Topic.find(@comment.topic_id)
	@comment.destroy
	render json: @topic
  end



  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:title, :content, :category_id, :user_id)
    end
	
    def comment_params
      params.require(:comment).permit(:content, :topic_id, :user_id)
    end
end
