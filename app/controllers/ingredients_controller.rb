class IngredientsController < ApplicationController

    get '/ingredients' do 
        @ingredients = Ingredient.all 
        erb :'/ingredients/index'
    end
    
    get '/ingredients/new' do 
        if !Helpers.logged_in?(session)
            redirect '/'
        end
        erb :'/ingredients/new'
    end

    get '/ingredients/:id' do 
        if !Helpers.logged_in?(session)
            redirect '/'
        else
            @ingredient = Ingredient.find_by_id(params[:id])
            if !@ingredient
                redirect to '/ingredients'
            end
        end
        erb :'/ingredients/show'
    end

    get '/ingredients/:id/edit' do 
        @ingredient = Ingredient.find_by_id(params[:id])
        if !@ingredient || !Helpers.logged_in?(session) || @ingredient.user != Helpers.current_user(session)
            redirect '/'
        end
        erb :'/ingredients/edit'
    end

    patch '/ingredients/:id' do
        ingredient = Ingredient.find_by_id(params[:id])

        # if ingredient && ingredient.pizza== Helpers.current_user(session) ??

        if ingredient && ingredient.user == current_user
            ingredient.update(params[:ingredient])
            redirect to "/ingredients/#{ingredient.id}"
        else
            redirect to "/ingredients"
        end 
    end

    post '/ingredients' do 
        ingredient = Ingredient.create(params)
        user = Helpers.current_user(session)
        ingredient.user = user

        # ingredient.pizza = pizza ??
        ingredient.save

        redirect to "/ingredients/#{ingredient.id}"
    end

    delete '/ingredients/:id/delete' do 
        ingredient = Ingredient.find_by_id(params[:id])
        user = Helpers.current_user(session)

        # if ingredient && ingredient.pizza == Helpers.current_user(session) ??

        if ingredient && ingredient.user == Helpers.current_user(session)
            ingredient.destroy
        end

        redirect to "/users/#{user.id}"
    end
    
end