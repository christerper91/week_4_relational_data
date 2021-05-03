class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    @products = Product.all
    erb :homepage
  end

  post '/get-name' do
    product = Product.new(params[:product])
    if product.save
      redirect "/add-items/#{product.id}"
    else
      "sorry there was an error"
    end
  end

  get '/add-items/:product_id' do
    @product = Product.find(params[:product_id])
    @items = Item.all
    erb :add_items
  end

  post '/add-items/:product_id' do
    product = Product.find(params[:product_id])
    item = product.items.new(params[:item])
    if item.save
      redirect "/add-items/#{product.id}"
    else
      "sorry there was an error"
    end
  end

  get '/edit/:item_id' do
    @item = Item.find(params[:item_id])

    erb :edit_item
  end

  post '/edit/:item_id' do
    item = Item.all
    if item.update
      redirect "/add-items/#{product.id}"
    else
      "sorry there was an error"
    end
  end
end
