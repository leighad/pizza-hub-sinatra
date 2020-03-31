class UsersController < ApplicationController
    get '/signup' do 
        if logged_in?
            redirect to "/users/#{current_user.id}"
        end
        erb :'/users/signup'
    end

    get '/login' do 
        if logged_in?
            redirect to "/users/#{current_user.id}"
        end
        erb :'/users/login'
    end

    get '/users' do 
        @users = User.all 
        erb :'/users/index'
    end

    get '/users/:id' do 
        if User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id])
            @pizzas = @user.pizzas  
        else
            redirect to 'users/signup'
        end
        erb :'users/show'
    end

    get '/logout' do 
        session.clear
        redirect to '/'
    end

    post '/signup' do
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            #add flash error message
            redirect to '/signup'
        end
    end

    post '/login' do 
        user = User.find_by(user_name: params[:user_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            #add flash error message
            redirect to '/signup'
        end
    end
end