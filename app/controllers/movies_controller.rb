class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # condition = 'movies.title @@ :param or ' \
      #             'movies.synopsis @@ :param or ' \
      #             'directors.first_name @@ :param or ' \
      #             'directors.last_name @@ :param'
      # @movies = Movie.where(condition, param: "%#{params[:query]}%").joins(:director)
      # @movies = Movie.global_search(params[:query])
      @results = PgSearch.multisearch(params[:query])
    else
      @movies = Movie.all
    end
  end
end
