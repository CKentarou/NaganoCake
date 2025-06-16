class Admin::BaseController < ApplicationController
    before_action :authenticate_admin!
  
    def after_sign_in_path_for(resource)
      admin_root_path
    end
  
end