
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end


  get '/articles' do    #show all articles
    @articles = Article.all 
    
  erb :'index'

  end

   get '/articles/new' do #create new articles
    
    @article = Article.new
   
    erb :'new'

   end

   post '/articles' do   
     
   article = Article.create(params)

   redirect "/articles/#{article.id}" #interpolate the articles back to article id is in )

   end


   get '/articles/:id' do  #should be able to read specific articles
      
   @article = Article.find(params[:id])
      
   erb :'show'

   end

  get'/articles/:id/edit' do 

    @article = Article.find(params[:id])

    erb :'edit'
   
  end

    
  patch '/articles/:id' do 

    @article = Article.find(params[:id])
    @article.update(:title => params[:title], :content => params[:content]) 
    redirect "/articles/#{@article.id}"

  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])  #first find the article to destroy
    @article.destroy  #articles already has the instance.
    
    redirect '/articles'

  end

end



