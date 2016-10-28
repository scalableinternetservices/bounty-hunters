class PagesController < ApplicationController
    
    
    
    def home
    end
    
    def mainpage
        if current_user
            @tasks = Task.all
        else
            redirect_to new_user_session_path, notice: 'Log in to see main application page.'
        end
    end
    
    def _navigation
        @test = "WASSUP"
        @logged_in = true
        if current_user
            @logged_in = true
        else
            @logged_in = false
        end
    end
            
end
