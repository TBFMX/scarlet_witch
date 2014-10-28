class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    
  end

  def upload
    require 'csv'
      @cvs_file_path = DataFile.save(params[:archivo])
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts @cvs_file_path
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

      unless @cvs_file_path.blank?
        puts "-----------------direccion actual-2--------------"
        puts Dir.pwd
        puts "------------------------------------------------"
        directory = "public/data"
        Dir.chdir(directory) do
          if File.exist?(@cvs_file_path.to_s)
            puts "esta en local"
            arr_of_rows = CSV.read(@cvs_file_path.to_s)
           
            puts arr_of_rows.inspect

          else
            if File.exist?(@cvs_file_path.to_s)
              puts "esta en produccion"
              arr_of_rows = CSV.read(@cvs_file_path.to_s)
              puts arr_of_rows.inspect
            else
              puts "------------------------------------------------"
              puts "no entro a ninguno"
              puts @cvs_file_path.to_s
              puts @cvs_file_path.to_s
              puts "------------------------------------------------"
            end
          end
        end  
        
        arr_of_rows.each do |a|
          aux_contenier = a
          if aux_contenier.size == 9 and aux_contenier[0] != "nombre"
            Model.crete(nombre_generico: aux_contenier[0],description: aux_contenier[1],cantidad: aux_contenier[2],unidad: aux_contenier[3],precio: aux_contenier[4],multiplicador: aux_contenier[5],category_id: aux_contenier[6],subcategory_id: aux_contenier[7],origen: aux_contenier[8])
          end
        end
      end
      #redirect_to ingredients_path
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:nombre, :unidad, :yield)
    end
end
