class Public::BaseController < ApplicationController
    before_action :authenticate_customer!, except: [:top, :about]
  
    def after_sign_in_path_for(resource)
      root_path
    end
    
end