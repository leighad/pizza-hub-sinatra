class UsersController < ApplicationController
    get '/signup' do 
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to 'signup'
        end
    end
end