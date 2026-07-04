module Admin
  class BaseController < ApplicationController
    before_action :require_admin

    private

    def require_admin
      redirect_to admin_login_path, alert: "Admin access required." unless session[:admin_authenticated]
    end
  end
end
