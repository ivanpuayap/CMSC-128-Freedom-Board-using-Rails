class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
		@post = Post.new
		@posts = Post.search(params[:search])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		
	end


	private

		def find_post
			@post = Post.find(params[:id])
		end
		def post_params
			params.require(:post).permit(:author, :content, :search)
		end
end
