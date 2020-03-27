class PizzasController < ApplicationController
    
    get '/pizzas/new' do 
        erb :'/pizzas/new'
    end

    get '/pizzas/show' do 
        erb :'/pizzas/show'
    end

    get '/pizzas/:id' do 
        @pizza = Pizza.find_by(id: params[:id])
        # @user = User.find_by(id: params[:id])
        if !@pizza
            redirect to '/pizzas'
        end
        erb :'/pizzas/show'
    end

    post '/pizzas' do 
        pizza = Pizza.create(params)
        user = Helpers.current_user(session)
        pizza.user = user
        pizza.save

        redirect to "/users/#{user.id}"
    end

end