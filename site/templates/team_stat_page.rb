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
          <h1 id = "top"><%= name %></h1>
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
          <th colspan="1">Best Season</th>
          <th colspan="1">Worst Season</th>
          </tr>
          </thead>
          <tbody>
          <% all_teams.each do |team_id, team| %>
            <tr>
            <td><a href="#<%=team_id%>"><%= team.team_name %></a></td>
            <td><%= stat_tracker.average_win_percentage(team_id) %></td>
            <td><%= stat_tracker.most_goals_scored(team_id) %></td>
            <td><%= stat_tracker.fewest_goals_scored(team_id) %></td>
            <td><%= stat_tracker.favorite_opponent(team_id) %></td>
            <td><%= stat_tracker.rival(team_id) %></td>
            <td><%= stat_tracker.biggest_team_blowout(team_id) %></td>
            <td><%= stat_tracker.worst_loss(team_id) %></td>
            <td><%= stat_tracker.best_season(team_id) %></td>
            <td><%= stat_tracker.worst_season(team_id) %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
      <br>

      <% all_teams.each do |team_id, team| %>
        <table class = "half">
          <thead>
            <tr class = "first">
              <th colspan="2" id="<%= team_id %>"> <%= team.team_name %> - Head-to-Head Statistics</th>
            </tr>
            <tr>
              <th colspan="1">Opponent</th>
              <th colspan="1">Win-Loss Percentage</th>
            </tr>
          </thead>
          <tbody>
          <% stat_tracker.head_to_head(team_id).each do |team_name, value| %>
            <tr>
              <td><%= team_name %></td>
              <td><%= value %></td>
            </tr>
            <% end %>
          </tbody>
        </table>
        <br>

        <% seasonal_sum = stat_tracker.seasonal_summary(team_id) %>

        <table>
          <thead>
            <tr class = "first" >
              <th colspan="7"><%=team.team_name %> Seasonal Summary</th>
            </tr>
            <tr>
              <th colspan="1">Season</th>
              <th colspan="1">Type</th>
              <% column_names = [ "Win Percentage",
                                  "Total Goals Scored",
                                  "Total Goals Against",
                                  "Average Goals Scored",
                                  "Average Goals Against",
                                ] %>
              <% column_names.each do |col| %>
                <th colspan="1"><%=col %></th>
              <% end %>
            </tr>
          </thead>

          <tbody>
            <% seasonal_sum.each do |season, hash_pair| %>
              <% hash_pair.each do |type, stats| %>
              <tr>
                <td><%=season%></td>
                <td><%=type.to_s.gsub("_", " ").capitalize %></td>
                <% stats.values.each do |value| %>
                  <td><%=value %></td>
                <% end %>
              </tr>

              <% end %>
            <% end %>
          </tbody>

        </table>
        <br>
        <p><a href="#top">Top of Page</a></p>
        <br>


      <% end %>
      </body>
    </html>
    }
  end
end
