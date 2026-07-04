module Admin
  class GamesController < BaseController
    before_action :set_game, only: %i[edit update destroy]

    def index
      @games = Game.menu_order
    end

    def new
      @game = Game.new(position: next_position, published: true, genre: "Arcade")
    end

    def edit
    end

    def create
      @game = Game.new(game_params)

      if @game.save
        redirect_to admin_root_path, notice: "Game added."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @game.update(game_params)
        redirect_to admin_root_path, notice: "Game updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @game.destroy
      redirect_to admin_root_path, notice: "Game removed."
    end

    private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title, :url, :genre, :cabinet_code, :description, :position, :published)
    end

    def next_position
      Game.maximum(:position).to_i + 1
    end
  end
end
