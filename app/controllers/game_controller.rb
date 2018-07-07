class GameController < ApplicationController
  def main
    @guessed_event = nil
    @guessed_date = nil
    if params.has_key?(:guess)
      guess_params = params.require(:guess).permit(:event_id, :date)
      guess_params.require([:event_id, :'date(1i)', :'date(2i)', :'date(3i)'])
      @guessed_event = Event.find(guess_params[:event_id])
      @guessed_date = Date.new(guess_params[:'date(1i)'].to_i, guess_params[:'date(2i)'].to_i, guess_params[:'date(3i)'].to_i)
    end

    @new_event = Event.order('RANDOM()').first
  end
end
