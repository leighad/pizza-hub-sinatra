class UsersController < ApplicationController
    get '/signup' do 
        erb :'/users/signup'
    end

    get '/login' do 
        erb :'/users/login'
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