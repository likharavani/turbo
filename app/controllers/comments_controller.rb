class CommentsController < ApplicationController
  before_action :set_article, except: [:show]

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { redirect_to article_url(5) }
      end
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
    @comment = @article.comments.find_by(id: params[:id])
  end

  def update
    @comment = @article.comments.find_by(id: params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @article, notice: 'Comment was successfully updated.' }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/comment', locals: { comment: @comment }) }
      end
    end
  end

  def destroy
    @comment = @article.comments.find_by(id: params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
