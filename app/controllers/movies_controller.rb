class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)

        if @movie.save
            redirect_to @movie
        else
         render :new, status: :unprocessable_entity
        end
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])

        if @movie.update(movie_params_update)
            redirect_to @movie
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        

        redirect_to movies_path
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :overview)
    end

    def movie_params_update
        params.require(:movie).permit(:title, :overview, :rating, :poster_url)
    end

end
