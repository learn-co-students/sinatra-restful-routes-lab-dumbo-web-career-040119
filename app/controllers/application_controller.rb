class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end
  # code actions here!

  #View
  get '/' do
    redirect to "/recipes"
  end

  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

  #Creation
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #Editing
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  end

  #Delete
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect to "/recipes/"
  end

end
