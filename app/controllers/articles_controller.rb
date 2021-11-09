# Articles Controller
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
    if Current.user && can_create_article?
      @article = Article.new(article_params)
      @article.user_id = Current.user.id

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if Current.user
      @article = Article.find(params[:id])

      if @article.user_id == Current.user.id
        if @article.update(article_params)
          redirect_to @article
        else
          render :edit
        end
      else
        redirect_to @article, alert: 'Not Authorised'
      end
    end
  end

  def destroy
    if Current.user
      @article = Article.find(params[:id])

      if can_delete_article?
        @article.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        redirect_to @article, alert: 'Not Authorised'
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status, :topic_id)
  end

  def can_create_article?
    Current.user.has_permission?('article') || Current.user.has_permission?('admin')
  end

  def can_delete_article?
    (@article.user_id == Current.user.id) || Current.user.has_permission?('admin')
  end
end
