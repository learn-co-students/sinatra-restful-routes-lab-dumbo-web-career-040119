class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get ('/') do
    redirect to '/recipes'
  end

  get ('/recipes') do
    @recipes = Recipe.all
    erb :index
  end

  get ('/recipes/new') do
    erb :new
  end

  get ('/recipes/:id') do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post ('/recipes') do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{ @recipe.id }"
  end

  post ('/recipes/new') do
    redirect to '/recipes/new'
  end

  post ('/recipes/back') do
    redirect to '/recipes'
  end

  get ('/recipes/:id/edit') {
    @recipe = Recipe.find(params[:id])
    erb :edit
  }

  patch ('/recipes/:id') {
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  }

  delete ('/recipes/:id') {
    Recipe.destroy(params[:id])
    redirect to '/recipes'
  }

end
