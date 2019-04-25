class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end

  #read
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #create
  get '/recipes/new' do
    erb :new
  end

  #create
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #read
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  #update
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  #sakujo
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
  end

end
