class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy,:ingrediente,:material, :procesos]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ingrediente
    @ingredientes = Ingredient.all
  end
  def material
    @materiales = Material.all
  end
  def procesos
    @procedimientos = Procedure.all
  end

  def asignar_ingrediente
    if params[:recipe_id].exist? and params[:ing_id].exist?
      recipe_id = params[:recipe_id]
      ing_id =  params[:ing_id]
      RecipeIngredients.create(:recipe_id => recipe_id, :ingredient_id => ing_id )
    end

    if params[:nombre].exist? and params[:unidad].exist?  and params[:yield].exist?
      @ingrediente = Ingredient.create(:nombre => params[:nombre], :unidad => params[:unidad], :yield => params[:yield])
      recipe_id = params[:recipe_id]
      RecipeIngredients.create(:recipe_id => recipe_id, :ingredient_id => @ingrediente.id )
    end  
    puts ">>>>>>>>>>>>>>>"
    puts params.inspect
    puts "<<<<<<<<<<<<<<<"
    redirect_to recipe_path(recipe_id)

  end
  def asignar_material
    if params[:recipe_id].exist? and params[:mat_id].exist?  
      recipe_id = params[:recipe_id]
      mat_id =  params[:mat_id]
      RecipeMaterials.create(:recipe_id => recipe_id, :material_id => mat_id )
    end

    if params[:nombre].exist? and params[:unidad].exist?  and params[:consumible].exist?
      @material = Material.create(:nombre => params[:nombre], :unidad => params[:unidad], :consumible => params[:consumible])
      recipe_id = params[:recipe_id]
      RecipeMaterials.create(:recipe_id => recipe_id, :material_id => @@material.id )
    end  
    redirect_to recipe_path(recipe_id)

  end
  def asignar_procesos
    unless(params[:recipe_id].blank? and params[:pros_id].blank?)
      recipe_id = params[:recipe_id]
      pros_id =  params[:pros_id]
      RecipeProcedure.create(:recipe_id => recipe_id, :procedure_id => pros_id )
    end
    unless(params[:nombre].blank? and params[:instrucciones].blank?)
      @procedure = Procedure.create(:nombre => params[:nombre], :instrucciones => params[:instrucciones])
      recipe_id = params[:recipe_id]
      RecipeProcedure.create(:recipe_id => recipe_id, :procedure_id => @procedure.id )
    end

    unless params[:otro].blank?
      redirect_to recipe_path(:id =>recipe_id)
    else
      redirect_to or_proceso_path(:id =>recipe_id)   
    end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:nombre, :recipe_procidure_id, :recipe_ingredient_id, :recipe_materials_id)
    end
end
