module TeamStatPage

  def team_stat_table
    %{
      <!DOCTYPE html>
      <html>
        <head>
        <link href="stylesheet.css" rel="stylesheet">
        </head>
          <body>
          <header>
          <nav class="crumbs">
            <ol>
              <li class="crumb"><a href="./index.html">Stat Attack</a></li>
            </ol>
            </nav>
          </header>
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
end
