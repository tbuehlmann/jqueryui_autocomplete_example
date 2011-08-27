class MoviesController < ApplicationController
  def index
    # if the params[:search] param is given, grab the corresponding records,
    # else grab all. paginate in both cases
    if params[:search]
      @movies = Movie.where('name LIKE ?', "#{params[:search]}%").page(params[:page]).order(:name)
    else
      @movies = Movie.page(params[:page]).order(:name)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :action => :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
      redirect_to @movie, :notice => 'Movie was successfully updated.'
    else
      render :action => :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  def autocomplete
    # the autocomplete library needs a result in the form of
    # [{"label":"foo","value":"foo"},{"label":"bar","value":"bar"}]
    # or
    # [{"value":"foo"},{"value":"bar"}] if label and value are the same
    #
    # in this case we grab all movies that begin with the typed term and
    # rename the name attribute to value for convenience
    movies = Movie.select('name AS value').where('name LIKE ?', "#{params[:term]}%")
    render :json => movies.to_json
  end
end

