class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
    @all_games = Game.select('games.id, games.name as game_name, game_players.score, game_players.player_id').joins('left join game_players on (game_players.game_id = games.id)').group_by{|g| g.id}

    
    @won_games = @all_games.map{|k, v| v.sort_by { |h| -h['score'] }.first  }.select{|gm| gm['player_id'] == @player.id }
    @lost_games = @all_games.map{|k, v| v.sort_by { |h| h['score'] }.first  }.select{|gm| gm['player_id'] == @player.id }
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to players_url, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to players_url, notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:name, :phone)
  end
end
