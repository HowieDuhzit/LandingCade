module Admin
  class SettingsController < BaseController
    def edit
      @settings = SiteSetting.current
    end

    def update
      @settings = SiteSetting.current

      if @settings.update(settings_params)
        redirect_to admin_root_path, notice: "Boot menu updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def settings_params
      params.require(:site_setting).permit(
        :site_name,
        :headline,
        :subheadline,
        :accent_color,
        :secondary_color,
        :background_color,
        :footer_note
      )
    end
  end
end
