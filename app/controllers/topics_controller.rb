class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /random_topics/1
  def rand_topic
	@ua = UserAch.find_by(user_id: params[:user_id], achievment_id: 1)
	if @ua
	  @ua.counter = @ua.counter + 1
	  if @ua.counter >= 5
		@ua.check = true
	  end
	else
	  @ua = UserAch.new(user_id: params[:user_id], achievment_id: 1, counter: 1)
	end
	@ua.save


	@lk = Like.where(user: params[:user_id])
	@liked = []
	@lk.each do |l|
	  @liked = @liked + Topic.where(id: l.topic_id)
	end
	
	@dlk = Dislike.where(user: params[:user_id])
	@dliked = []
	@dlk.each do |l|
	  @dliked = @dliked + Topic.where(id: l.topic_id)
	end

	@full = @dlk + @lk
	number = []
	@full.each do |t|
	  number = number + [t.id]
	end

	array = []
	@topic = Topic.all
	@topic.each do |t|
	  if number.include?(t.id) != true
		array = array + [t]
	  end
	end
	@topic = array[rand(0..array.size-1)]
	render json: @topic
  end


  # GET /topics/1
  def show
    render json: @topic
  end
  
  # GET /topics/:topic_id/show_like/:user_id
  def show_like
	  @like = Like.where(user_id: params[:user_id], topic_id: params[:topic_id])
	  render json: @like
  end

  # GET /topics/:topic_id/show_dislike/:user_id
  def show_dislike
	  @dislike = Dislike.where(user_id: params[:user_id], topic_id: params[:topic_id])
	  render json: @dislike
  end

  # PATCH /topics/:topic_id/like/:user_id
  def like
	@like = Like.where(user_id: params[:user_id], topic_id: params[:topic_id])
	@ua = UserAch.find_by(user_id: params[:user_id], achievment_id: 2)
	@topic = Topic.find(params[:topic_id])
	@dislike = Dislike.where(user_id: params[:user_id], topic_id: params[:topic_id])

	if @dislike.first.present?
		@dislike.destroy_all
		@topic.dislike_counter = @topic.dislike_counter - 1
	end


	if @like.present?
		@like.destroy_all
		@topic.like_counter = @topic.like_counter - 1
		@ua.counter = @ua.counter - 1
	else
		@like = Like.new(user_id: params[:user_id], topic_id: params[:topic_id])
		@like.save
		@topic.like_counter = @topic.like_counter + 1

		if @ua

			@ua.counter = @ua.counter + 1

			if @ua.counter >= 5
				@ua.check = true
			end
		else
			@ua = UserAch.new(user_id: params[:user_id], achievment_id: 2, counter: 1)
		end
	end

	@ua.save
	@topic.save

	render json: @like

  end
  
  # PATCH /topics/:topic_id/dislike/:user_id
  def dislike
	@dislike = Dislike.where(user_id: params[:user_id], topic_id: params[:topic_id])
	@topic = Topic.find(params[:topic_id])
	@like = Like.where(user_id: params[:user_id], topic_id: params[:topic_id])

	if @like.first.present?
		@like.destroy_all
		@topic.like_counter = @topic.like_counter - 1
	end

	if @dislike.first.present?
		@dislike.destroy_all
		@topic.dislike_counter = @topic.dislike_counter - 1
	else
		@dislike = Dislike.new(user_id: params[:user_id], topic_id: params[:topic_id])
		@dislike.save
		@topic.dislike_counter = @topic.dislike_counter + 1

	end
	@ua.save
	@topic.save

	render json: @dislike

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

  # DELETE /topics/1/comments/1/
  def comment_delete
    @comment = Comment.find(params[:comment_id])
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
      params.require(:topic).permit(:title, :content, :category_id, :user_id, :like_counter, :dislike_counter)
    end
	
    def comment_params
      params.require(:comment).permit(:content, :topic_id, :user_id)
    end
end
