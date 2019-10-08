class ArticlesController < ApplicationController
  # index
  get "/articles" do
    erb :"articles/index"
  end

  # new
  get "/articles/new" do
    erb :"articles/new"
  end

  # show
  get "/articles/:id/?" do
    @article = Article.find(params[:id])
    erb :"articles/show"
  end

  # create
  post "/articles" do
    @article = Article.create(params)
    redirect "articles/#{@article.id}"
  end

  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :"articles/edit"
  end

  # update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    redirect "articles/#{@article.id}"
  end

  # destroy
  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end
end
