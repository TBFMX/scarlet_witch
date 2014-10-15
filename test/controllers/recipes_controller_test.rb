require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { nombre: @recipe.nombre, recipe_ingredient_id: @recipe.recipe_ingredient_id, recipe_materials_id: @recipe.recipe_materials_id, recipe_procidure_id: @recipe.recipe_procidure_id, tiempo_preparacion: @recipe.tiempo_preparacion }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { nombre: @recipe.nombre, recipe_ingredient_id: @recipe.recipe_ingredient_id, recipe_materials_id: @recipe.recipe_materials_id, recipe_procidure_id: @recipe.recipe_procidure_id, tiempo_preparacion: @recipe.tiempo_preparacion }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end
