class PizzasController < ApplicationController
    
    get '/pizzas/new' do 
        erb :'/pizzas/new'
    end

end