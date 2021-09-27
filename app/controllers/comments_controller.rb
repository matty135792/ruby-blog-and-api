class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.build(comment_params)

    @comment = Comment.new(comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to article_path(@article), success: 'comment created'
    else
      render :new, notice: "HELLO THERE"
    end


  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end