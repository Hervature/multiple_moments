class HeadersController < ApplicationController
  before_action :set_header, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /headers
  # GET /headers.json
  def index
    @headers = Header.all
  end

  # GET /headers/new
  def new
    @header = Header.new
  end

  # GET /headers/1/edit
  def edit
  end

  # POST /headers
  def create
    @header = Header.new(header_params)

    if @header.save
      redirect_to headers_path, notice: 'Header was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /headers/1
  def update
    if @header.update(header_params)
      flash[:success] = "Header updated"
      redirect_to headers_path
    else
      render 'edit'
    end
  end

  # DELETE /headers/1
  # DELETE /headers/1.json
  def destroy
    @header.destroy
    respond_to do |format|
      format.html { redirect_to headers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header
      @header = Header.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def header_params
      params.require(:header).permit(:title, :show_in_nav)
    end
end
