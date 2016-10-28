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

  def font_category_selection
    case params[:font_category]
      when "Animal"
        @font_category = FontCategory.find_by_name("Animal")
      when "Celtic"
        @font_category = FontCategory.find_by_name("Celtic")
      when "Famous"
        @font_category = FontCategory.find_by_name("Famous")
      when "Graffiti"
        @font_category = FontCategory.find_by_name("Graffiti")
      when "Misc"
        @font_category = FontCategory.find_by_name("Misc")
      end
  end
  respond_to do |format|
    format.js
    format.html
  end

end
