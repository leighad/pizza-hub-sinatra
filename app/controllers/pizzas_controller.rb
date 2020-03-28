class PizzasController < ApplicationController
    
    get '/pizzas' do 
        @pizzas = Pizza.all 
        erb :'/pizzas/index'
    end
    
    get '/pizzas/new' do 
        if !Helpers.logged_in?(session)
            redirect '/'
        end
        erb :'/pizzas/new'
    end

    get '/pizzas/show' do
        if !Helpers.logged_in?(session)
            redirect '/'
        end
        erb :'/pizzas/show'
    end

    get '/pizzas/:id' do 
        if !Helpers.logged_in?(session)
            redirect '/'
        else
            @pizza = Pizza.find_by(id: params[:id])
            # @user = User.find_by(id: params[:id])
            if !@pizza
                redirect to '/pizzas'
            end
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