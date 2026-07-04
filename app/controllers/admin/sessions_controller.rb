module Admin
  class SessionsController < ApplicationController
    def new
      redirect_to admin_root_path if session[:admin_authenticated]
    end

    def create
      if valid_password?(params[:password].to_s)
        session[:admin_authenticated] = true
        redirect_to admin_root_path, notice: "Admin console online."
      else
        flash.now[:alert] = "Invalid access code."
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      reset_session
      redirect_to root_path, notice: "Admin session closed."
    end

    private

    def valid_password?(password)
      expected = ENV["ADMIN_PASSWORD"].presence || "arcade-admin"
      ActiveSupport::SecurityUtils.secure_compare(
        Digest::SHA256.hexdigest(password),
        Digest::SHA256.hexdigest(expected)
      )
    end
  end
end
