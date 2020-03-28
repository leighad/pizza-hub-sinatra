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
            if !@pizza
                redirect to '/pizzas'
            # else
            #     @result = params['pizza_description']
            end
        end
        erb :'/pizzas/show'
    end

    # need data from textarea to display upon edit request

    get '/pizzas/:id/edit' do 
        @pizza = Pizza.find_by(id: params[:id])
        if !@pizza || !Helpers.logged_in?(session) || @pizza.user != Helpers.current_user(session)
            redirect '/'
        end
        erb :'/pizzas/edit'
    end

    patch '/pizzas/:id' do
        pizza = Pizza.find_by(id: params[:id])

        if pizza && pizza.user == Helpers.current_user(session)
            pizza.update(params[:pizza])
            redirect to "/pizzas/#{pizza.id}"
        else
            redirect to "/pizzas"
        end 
    end

    post '/pizzas' do 
        pizza = Pizza.create(params)
        user = Helpers.current_user(session)
        pizza.user = user
        pizza.save

        # redirect to "/users/#{user.id}"
        redirect to "/pizzas/#{pizza.id}"
    end

end