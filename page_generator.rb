require './lib/stat_tracker'
require 'csv'
require 'erb'

def get_template()
  %{
  <html>
    <body>
      <h1><%= name %></h1>
      <ul>
        <% all_teams.each do |team_id, team| %>
          <li><%= team.team_name %></li>
        <% end %>
      </ul>
    </body>
  </html>
  }
end

class PageGenerator
  include ERB::Util
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

site = PageGenerator.new(stat_tracker, get_template, "Stat Attack!")
site.save('./site/index.html')
