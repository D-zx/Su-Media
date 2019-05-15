class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    session[:user]= current_user.role_id
    @posts = Post.all.order(:cached_votes_score => :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end

  # GET /posts/new
  def new

    @post = Post.new
    @post.user = current_user
  end

  # GET /posts/1/edit
  def edit
  end

  def upvote
     @post.upvote_from current_user
     redirect_to posts_path
  end

  def downvote
    @post.downvote_from current_user
    redirect_to posts_path
  end
  # POST /posts
  # POST /posts.json
  def create

    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      if params[:post][:image].present?
        render :crop
      else
        redirect_to @post, notice: "Successfully created post!"
      end
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.update_attributes(post_params)
      if params[:post][:image].present?
        render :crop
      else
        redirect_to @post, notice: "Successfully updated post!"
      end
    else
      render :new
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }

    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :description, :image, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
