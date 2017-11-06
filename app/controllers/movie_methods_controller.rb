class MovieMethodsController < ApplicationController

    def top5
        movie_id = params[:id]
        reviews = Review.where("movie_id = ?", movie_id).order("rating desc").limit(5)
        render json: reviews
    end

end