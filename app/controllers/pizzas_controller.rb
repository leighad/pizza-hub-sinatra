class PizzasController < ApplicationController
    
    get '/pizzas' do
        redirect_if_not_logged_in
        @pizzas = Pizza.all 
        erb :'/pizzas/index'
    end
    
    get '/pizzas/new' do 
        if !logged_in?
            redirect '/'
        end
        @pizza = Pizza.new
        erb :'/pizzas/new'
    end

    get '/pizzas/most-recent' do
        pizza = Pizza.last
        #step 1: get the pizza
        #step 2: redirect

        redirect to "/pizzas/#{pizza.id}"
    end

    get '/pizzas/:id' do 
        if !logged_in?
            redirect '/'
        else
            # binding.pry 
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
        if !@pizza || !logged_in? || @pizza.user != current_user
            redirect '/'
        end
        erb :'/pizzas/edit'
    end

    patch '/pizzas/:id' do
        @pizza = Pizza.find_by(id: params[:id])

        if @pizza && @pizza.user == current_user
            if @pizza.update(params[:pizza])
                redirect to "/pizzas/#{@pizza.id}"
            else
                erb :'/pizzas/edit'
            end
        else
            redirect to "/pizzas"
        end 
    end

    post '/pizzas' do 
        @pizza = current_user.pizzas.build(params)
        #@pizza.user = current_user
        if @pizza.save
            redirect to "/pizzas/#{@pizza.id}"
        else
            erb :'/pizzas/new'
        end
    end

    delete '/pizzas/:id/delete' do 
        pizza = Pizza.find_by_id(params[:id])
        user = current_user

        if pizza && pizza.user == current_user
            pizza.destroy
        end

        redirect to "/users/#{user.id}"
    end

end

#Write a route '/pizzas/most-recent' that shows the user the last pizza made in the database doesn't matter if they're the owner or not

