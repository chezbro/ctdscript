class FontCategoriesController < ApplicationController
  before_action :set_font_category, only: [:show, :edit, :update, :destroy]

  # GET /font_categories
  # GET /font_categories.json
  def index
    @font_categories = FontCategory.all
  end

  # GET /font_categories/1
  # GET /font_categories/1.json
  def show
  end

  # GET /font_categories/new
  def new
    @font_category = FontCategory.new
  end

  # GET /font_categories/1/edit
  def edit
  end

  # POST /font_categories
  # POST /font_categories.json
  def create
    @font_category = FontCategory.new(font_category_params)

    respond_to do |format|
      if @font_category.save
        format.html { redirect_to @font_category, notice: 'Font category was successfully created.' }
        format.json { render :show, status: :created, location: @font_category }
      else
        format.html { render :new }
        format.json { render json: @font_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /font_categories/1
  # PATCH/PUT /font_categories/1.json
  def update
    respond_to do |format|
      if @font_category.update(font_category_params)
        format.html { redirect_to @font_category, notice: 'Font category was successfully updated.' }
        format.json { render :show, status: :ok, location: @font_category }
      else
        format.html { render :edit }
        format.json { render json: @font_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /font_categories/1
  # DELETE /font_categories/1.json
  def destroy
    @font_category.destroy
    respond_to do |format|
      format.html { redirect_to font_categories_url, notice: 'Font category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_font_category
      @font_category = FontCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def font_category_params
      params.require(:font_category).permit(:name, :number_of_fonts)
    end
end
