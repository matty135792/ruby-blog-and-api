class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.build(comment_params)

    @comment = Comment.new(comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to article_path(@article), success: 'comment created'
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if(Current.user.email == @comment.commenter)
      @comment.destroy
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article), alert: "Not Authorised to delete this"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end