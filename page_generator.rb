require_relative 'lib/stat_tracker'
require_relative 'site/templates'
require 'csv'
require 'erb'
include Templates

class PageGenerator
  include ERB::Util
  include Templates

  attr_accessor :name,
                :stat_tracker,
                :all_games,
                :all_teams,
                :all_game_teams

  def initialize(stat_tracker, template, name)
    @name = name
    @stat_tracker = stat_tracker
    @all_games = stat_tracker.all_games
    @all_teams = stat_tracker.all_teams
    @all_game_teams = stat_tracker.all_game_teams
    @template = template
  end

  def render()
    ERB.new(@template).result(binding)
  end

  def save(file)
    File.open(file, "w+") do |f|
      f.write(render)
    end
  end

end

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)
team_stat_site = PageGenerator.new(stat_tracker, team_stat_table, "Team Statistics")
team_stat_site.save('./site/team_stats.html')

game_stats_site = PageGenerator.new(stat_tracker, game_stats_table, "Game Statistics")
game_stats_site.save('./site/game_stats.html')
