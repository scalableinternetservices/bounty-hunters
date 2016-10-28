class PagesController < ApplicationController
    
    
    
    def home
        if current_user
            redirect_to main_app_path
        end
    end
    
    def mainpage
        if current_user
            @tasks = Task.all
        else
            redirect_to new_user_session_path, notice: 'Log in to see main application page.'
        end
    end
    
            
end
