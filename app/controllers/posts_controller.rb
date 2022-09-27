class PostsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def index
        render json: Post.all
    end

    def show
        render json: find_post
    end

    def create
        post=Post.create!(post_params)
        render json: post
    end

    def update
        post=find_post
        post.update!(post_params)
    end

    private

    def find_post
        Post.find_by(id:params[:id])
    end

    def post_params
        params.permit :title, :content,:summary,:category
    end

    def render_not_found_response
        render json: {error:"No post with id: #{params[:id]}"}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
