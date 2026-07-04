class ArcadeController < ApplicationController
  def index
    @settings = SiteSetting.current
    @games = Game.published.menu_order
  end
end
