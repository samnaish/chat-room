class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        return @curent_user if @curent_user.present?
        if session[:user_id].present?
            @curent_user = User.find(session[:user_id])
        else
            @curent_user = User.generate
            session[:user_id] = @curent_user.id
            @curent_user
        end
    end
    

end
