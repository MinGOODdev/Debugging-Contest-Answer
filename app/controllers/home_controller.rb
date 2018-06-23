class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all.reverse
    else
      redirect_to '/users/sign_in'
    end
  end
  
  def new
    #debug : new <-> create (swap)
  end

  def create
    @post = Post.new
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.user_id = current_user.id
    
      hashtags = params[:hashtags].split(',')
      hashtags.each do |tag|
        hashtag = Hashtag.find_or_create_by(name: tag.delete('#'))
        hashtag.save
        @post.hashtags << hashtag
      end
      
    uploader = ImguploaderUploader.new
    uploader.store!(params[:img])
    @post.img_url = uploader.url
    
    @post.save
    
    redirect_to '/home/index'
  end

  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.user_id = current_user.id
    @post.hashtags.clear
      
      hashtags = params[:hashtags].split(',')
      hashtags.each do |tag|
        hashtag = Hashtag.find_or_craete_by(name: tag.delete('#'))
        hashtag.save
        @post.hashtags << hashtag
      end
    
    @post.save #debug
    
    redirect_to '/home/index'
  end
  
  def delete
    post = Post.find(params[:post_id])
    
    #post.save
    post.destroy
    
    redirect_to '/home/index'
  end
end
