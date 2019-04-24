class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get ('/') {
    redirect to '/recipes'
  }


  get ('/recipes') {
    @recipes = Recipe.all
    erb :index
  }

  get ('/recipes/new') {
    erb :create_recipe
  }

  get ('/recipes/:id') {
    @recipe = Recipe.find(params[:id])
    erb :show
  }

  post ('/recipes') {
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{ @recipe.id }"
  }

  post ('/recipes/new') {
    redirect to '/recipes/new'
  }

  post ('/recipes/back_to_home') {
    redirect to '/recipes'
  }

  get ('/recipes/:id/edit') {
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
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
