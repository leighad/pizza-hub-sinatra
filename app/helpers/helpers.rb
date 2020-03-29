class Helpers

    def self.redirect_if_not_logged_in
        if !logged_in?
            redirect "/login?error=You must be logged in to do that!"
        end
    end
    
    def self.current_user(session)
        User.find_by_id(session[:user_id])
    end

    def self.logged_in?(session)
        !!session[:user_id]
    end

end