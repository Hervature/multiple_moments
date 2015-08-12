class ImagesController < ApplicationController
  before_action :set_image
  before_action :authenticate_user!

  def destroy
    @image.destroy
    redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end
end