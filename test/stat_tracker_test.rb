require 'minitest/autorun'
require 'minitest/pride'
require './lib/stat_tracker'
require 'csv'
require 'pry'

class StatTrackerTest < Minitest::Test

  def setup
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    @locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    @stat_tracker = StatTracker.from_csv(@locations)
    binding.pry
  end

  def test_from_csv
    assert_equal @locations, @stat_tracker
  end

  def test_read_file_lines
    line1_string = "game_id,season,type,date_time,away_team_id,home_team_id,away_goals,home_goals,venue,venue_link"
    assert_equal [line1_string], @stat_tracker[:games][0]
  end

  # def test_map_file_to_hash
  #   assert_equal 7441, @stat_tracker[:games].length
  # end

end
