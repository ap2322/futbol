module Templates

  def team_stat_table
    %{
      <!DOCTYPE html>
      <html>
        <head>
        <link href="stylesheet.css" rel="stylesheet">
        </head>
          <body>
          <h1><%= name %></h1>
      <table>
        <thead>
          <tr>
          <th colspan="1">Teams</th>
          <th colspan="1">Avg Win %</th>
          <th colspan="1">Most Goals Scored </th>
          <th colspan="1">Fewest Goals Scored </th>
          <th colspan="1">Favorite Opponent </th>
          <th colspan="1">Rival </th>
          <th colspan="1">Biggest Team Blowout</th>
          <th colspan="1">Worst Loss</th>
          </tr>
          </thead>
          <tbody>
          <% all_teams.each do |team_id, team| %>
            <tr>
            <td><%= team.team_name %></td>
            <td><%= stat_tracker.average_win_percentage(team_id) %></td>
            <td><%= stat_tracker.most_goals_scored(team_id) %></td>
            <td><%= stat_tracker.fewest_goals_scored(team_id) %></td>
            <td><%= stat_tracker.favorite_opponent(team_id) %></td>
            <td><%= stat_tracker.rival(team_id) %></td>
            <td><%= stat_tracker.biggest_team_blowout(team_id) %></td>
            <td><%= stat_tracker.worst_loss(team_id) %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
      </body>
    </html>
    }
  end

  def game_stats_table
    %{
      <!DOCTYPE html>
      <html>
        <head>
        <link href="stylesheet.css" rel="stylesheet">
        </head>
          <body>
          <h1><%= name %></h1>
      <table>
        <thead>
          <tr>
          <th colspan="1">Category</th>
          <th colspan="1">Result</th>
          </tr>
          </thead>
          <tbody>
            <tr>
            <td> Highest Total Score </td>
            <td><%= stat_tracker.highest_total_score %></td>
            </tr>
            <tr>
            <td> Lowest Total Score </td>
            <td><%= stat_tracker.lowest_total_score %></td>
            </tr>
            <tr>
            <td> Biggest Blowout </td>
            <td><%= stat_tracker.biggest_blowout %></td>
            </tr>
            <tr>
            <td> Percentage Home Wins </td>
            <td><%= stat_tracker.percentage_home_wins %></td>
            </tr>
            <tr>
            <td> Percentage Visitor Wins </td>
            <td><%= stat_tracker.percentage_visitor_wins %></td>
            </tr>
            <tr>
            <td> Percentage Ties </td>
            <td><%= stat_tracker.percentage_ties %></td>
            </tr>
            <tr>
            <td> Average Goals Per Game </td>
            <td><%= stat_tracker.average_goals_per_game %></td>
            </tr>
        </tbody>
      </table>

      <hr>

      <table>
      <thead>
        <tr>
        <th colspan="1">Season</th>
        <th colspan="1">Number of Games </th>
        <th colspan="1">Average Goals </th>
        </tr>
        </thead>
      <tbody>
        <% stat_tracker.count_of_games_by_season.each do |season, count| %>
          <tr>
          <td><%= season %></td>
          <td><%= count %></td>
          <td><%= stat_tracker.average_goals_by_season[season] %>
          </tr>
        <% end %>
      </tbody>
      </table>

      </body>
    </html>
    }
  end

  def league_stats_table
    %{
      <!DOCTYPE html>
      <html>
        <head>
        <link href="stylesheet.css" rel="stylesheet">
        </head>
          <body>
          <h1><%= name %></h1>
      <table>
        <thead>
          <tr>
          <th colspan="1">Number of Teams in the League</th>
          <th colspan="1">Best Offense </th>
          <th colspan="1">Worst Offense </th>
          <th colspan="1">Best Defense </th>
          <th colspan="1">Worst Defense </th>
          <th colspan="1">Highest Scoring Visitor </th>
          <th colspan="1">Highest Scoring Home Team </th>
          <th colspan="1">Lowest Scoring Visitor </th>
          <th colspan="1">Lowest Scoring Home Team </th>
          <th colspan="1">Winningest Team </th>
          <th colspan="1">Best Fans </th>
          <th colspan="1">Worst Fans </th>
          </tr>
          </thead>
          <tbody>
            <tr>
            <td><%= stat_tracker.count_of_teams %></td>
            <td><%= stat_tracker.best_offense %></td>
            <td><%= stat_tracker.worst_offense %></td>
            <td><%= stat_tracker.best_defense %></td>
            <td><%= stat_tracker.worst_defense %></td>
            <td><%= stat_tracker.highest_scoring_visitor %></td>
            <td><%= stat_tracker.highest_scoring_home_team %></td>
            <td><%= stat_tracker.lowest_scoring_visitor %></td>
            <td><%= stat_tracker.lowest_scoring_home_team %></td>
            <td><%= stat_tracker.winningest_team %></td>
            <td><%= stat_tracker.best_fans %></td>
            <td>
              <% stat_tracker.worst_fans.each do |team| %>
                <%=team + "\n" %>
                <% end %>
            </td>
            </tr>
        </tbody>
      </table>
      </body>
    </html>
    }
  end

end
