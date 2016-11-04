class TattoosController < ApplicationController
  before_action :set_tattoo, only: [:show, :edit, :update, :destroy]

  # GET /tattoos
  # GET /tattoos.json
  def index
    @tattoos = Tattoo.all
  end

  # GET /tattoos/1
  # GET /tattoos/1.json
  def show
    respond_to do |format|
      format.html
      # format.jpg do
      #   kit = IMGKit.new(render_to_string, height: 500, quality:100)
      #   # kit.stylesheets << "#{Rails.root}/assets/landings.css"
      #   send_data kit.to_jpg, type: "image/jpeg", disposition: "inline"
      # end
    end
  end

  # GET /tattoos/new
  def new
    @tattoo = Tattoo.new
  end

  # GET /tattoos/1/edit
  def edit
  end

  # POST /tattoos
  # POST /tattoos.json
  def create
    @tattoo = Tattoo.new(script: params[:script], size: params[:size], hex: params[:color])
    respond_to do |format|
      if @tattoo.save
        format.html { render root_url, notice: 'Tattoo was successfully created.' }
        format.json { render :show, status: :created, location: @tattoo }
      else
        format.html { render :new }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tattoos/1
  # PATCH/PUT /tattoos/1.json
  def update
    respond_to do |format|
      if @tattoo.update(tattoo_params)
        format.html { redirect_to @tattoo, notice: 'Tattoo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tattoo }
      else
        format.html { render :edit }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tattoos/1
  # DELETE /tattoos/1.json
  def destroy
    @tattoo.destroy
    respond_to do |format|
      format.html { redirect_to tattoos_url, notice: 'Tattoo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tattoo
      @tattoo = Tattoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tattoo_params
      params.fetch(:tattoo, {})
    end
end
