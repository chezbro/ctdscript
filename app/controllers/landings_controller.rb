class LandingsController < ApplicationController
  def index
    @tattoo = Tattoo.new
    @featured_fonts = Font.where(featured: true)
  end

  def update_text
   @updated_text = params[:tattoo][:script]
   respond_to do |format|
      format.js
      format.html
   end
  end


  def update_font_size
    case params[:font_size]

    when "small"
      @updated_font_size = "12"
    when "medium"
      @updated_font_size = "18"
    when "large"
      @updated_font_size = "24"
    end

   @updated_font_size = params[:custom_font_size].to_s if params[:custom_font_size].present?

   respond_to do |format|
      format.js
      format.html
   end
  end

end
