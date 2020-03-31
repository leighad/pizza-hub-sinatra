module Sinatra
    module Helpers

        def redirect_if_not_logged_in
            if !logged_in?
                redirect "/login?error=You must be logged in to do that!"
            end
        end
        
        def current_user
            User.find_by_id(session[:user_id])
        end

        def logged_in?
            !!session[:user_id]
        end

    end
end