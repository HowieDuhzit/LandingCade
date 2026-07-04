module Admin
  class DashboardController < BaseController
    def show
      @settings = SiteSetting.current
      @games = Game.menu_order
    end
  end
end
