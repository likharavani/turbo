class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      if @comment
        format.turbo_stream
        format.html{ redirect_to article_path(@article) }
      else
        format.turbo_stream { redirect_to article_url(5) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new # or set it to a default value if needed
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article

    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully updated.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/comment', locals: { comment: @comment }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article_id

    respond_to do |format|
      if @comment.destroy
        format.turbo_stream
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully destroyed.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/comment', locals: { comment: @comment }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
