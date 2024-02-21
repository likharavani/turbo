class ArticlesController < ApplicationController

  def index
    @articles = Article.all.load_async
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to article_url(@article.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @article = Article.create(article_params)
  #   respond_to do |format|
  #     if @article.save
  #       # format.turbo_stream
  #       format.turbo_stream
  #       # format.html { redirect_to article_url(@article.id) , notice: "Todo was successfully created." }

  #     else
  #       format.turbo_stream { redirect_to article_url(5) }
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_url(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article.destroy
      redirect_to articles_path, status: :see_other
    else
      redirect_to articles_path, alert: 'Failed to delete article.'
    end
  end

  private

  def article_params
    params.require(:article).permit(:name,:article_type)
  end

end
