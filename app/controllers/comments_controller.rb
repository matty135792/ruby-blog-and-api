class CommentsController < ApplicationController
  def create
    if Current.user
      if can_comment?
        @article = Article.find(params[:article_id])
        # @comment = @article.comments.build(comment_params)

        @comment = Comment.new(comment_params)
        @comment.article = @article

        if @comment.save
          redirect_to article_path(@article), success: 'comment created'
        else
          render :new
        end
      else
        redirect_to article_path(@article), success: 'Not autherised to comment'
      end
    else
      redirect_to article_path(@article), success: 'Login to comment'
    end
  end

  def destroy
    if Current.user
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])

      if(Current.user.email == @comment.commenter)
        @comment.destroy
        redirect_to article_path(@article)
      else
        redirect_to article_path(@article), alert: "Not Authorised to delete this"
      end
    else
      redirect_to article_path(@article), success: 'Login to delete'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

    def can_comment?
      Current.user.has_permission?('comment') || Current.user.has_permission?('admin')
    end
end