class UsersController < ApplicationController
    get '/signup' do 
        if Helpers.logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end
        erb :'/users/signup'
    end

    get '/login' do 
        if Helpers.logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
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
        else
            redirect to 'users/signup'
        end
        erb :'users/show'
    end

    post '/signup' do
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            #add flash error message
            redirect to 'signup'
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