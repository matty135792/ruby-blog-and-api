class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @recent_articles = Article.most_recent
    @topics = Topic.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :body, :status, :topic_id)
  end
end