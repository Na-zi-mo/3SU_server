class HomeController < ApplicationController
    def index
        @posts = Post.where(published: true).order(created_at: :DESC).limit(5)
    end
end
