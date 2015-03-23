class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /articles
  def index
    # Get articles through header to articles relationship
    @headers = Header.by_slug(params[:header_id])
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @headers = Header.all
  end

  # GET /articles/1/edit
  def edit
    @headers = Header.all
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      @headers = Header.all
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      @headers = Header.all
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to admin_index_path
  end

  # GET /admin/articles
  def admin_index
    @articles = Article.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :markup, :html, :author, :author_url, :header_id, :published, :featured, :public_access, images_attributes: [:id, :photo, :photo_file_name, :_destroy])
    end
end