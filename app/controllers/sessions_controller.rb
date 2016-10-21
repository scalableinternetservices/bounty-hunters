class Users::SessionsController < Devise::SessionsController
    protected
    def auth_options
        {scope: resource_name, recall: 'home#index' }
    end
end
