class LandingsController < ApplicationController
  def index
    @tattoo = Tattoo.new
  end

  def update_text
   @updated_text = params[:tattoo][:script]
   respond_to do |format|
      format.js
      format.html
   end
  end


  def update_font_size
   @updated_font_size = params[:font_size].to_s
   respond_to do |format|
      format.js
      format.html
   end
  end

end
