class PagesController < ApplicationController
    def home
    end
    
    def mainpage
        @tasks = Task.all
    end
end
