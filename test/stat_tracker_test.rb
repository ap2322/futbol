require './test_helper'
require 'minitest/pride'
require_relative '../lib/stat_tracker'
require_relative '../lib/team'
require_relative '../lib/game'
require_relative '../lib/game_team'
require 'pry'
require 'csv'

class StatTrackerTest < Minitest::Test

  def setup
    game_path = './test/test_data/games_sample_2.csv'
    team_path = './test/test_data/teams_sample.csv'
    game_teams_path = './test/test_data/game_teams_sample_2.csv'

    @locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    @stat_tracker = StatTracker.from_csv(@locations)
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_attributes_of_created_hashes
    expected_team_keys = ["1", "4", "26", "14", "6", "3", "5", "17", "28", "16", "2", "30", "19", "24", "15", "20"]
    assert_instance_of Hash, @stat_tracker.all_teams
    assert_equal expected_team_keys, @stat_tracker.all_teams.keys
    assert_instance_of Team, @stat_tracker.all_teams.values.first
    assert_equal "1", @stat_tracker.all_teams.values.first.team_id
    assert_equal "Atlanta United", @stat_tracker.all_teams.values.first.team_name

    assert_instance_of Hash, @stat_tracker.all_games
    assert_equal 40, @stat_tracker.all_games.keys.length
    assert_equal "2012030221", @stat_tracker.all_games.keys.first
    assert_instance_of Game, @stat_tracker.all_games.values.first
    assert_equal "2012030221", @stat_tracker.all_games.values.first.game_id
    assert_equal "Postseason", @stat_tracker.all_games.values.first.type

    assert_equal GameTeam, @stat_tracker.all_game_teams.values[0]["home"].class
    assert_equal 40, @stat_tracker.all_game_teams.keys.length
    assert_equal "2012020087", @stat_tracker.all_game_teams.keys.first
    assert_equal "2012020087", @stat_tracker.all_game_teams.keys.first
    assert_instance_of Hash, @stat_tracker.all_game_teams.values.first
    assert_equal ["away", "home"],@stat_tracker.all_game_teams.values.first.keys
    assert_instance_of GameTeam, @stat_tracker.all_game_teams.values[0]["away"]
    assert_equal "2012020087", @stat_tracker.all_game_teams.values.first["away"].game_id
    assert_equal 7, @stat_tracker.all_game_teams.values.first["away"].shots
  end

  def test_generate_hash
    test_hash = StatTracker.generate_hash('./test/test_data/teams_sample.csv', Team)
    test_team = test_hash["1"]

    assert_instance_of Hash, test_hash
    assert_instance_of Team, test_team
    assert_equal "Atlanta United", test_team.team_name
    assert_equal "ATL", test_team.abbreviation
  end
end
