module SeasonStatsPage
  def season_stats_table
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
          <% seasons = all_games.map {|game_id, game| game.season} %>
          <% seasons.uniq! %>
          <% seasons.each do |season| %>
            <h3>Season <%= season %></h3>
            <table>
              <thead>
                <tr>
                  <th colspan="1">Category</th>
                  <th colspan="1">Result</th>
                  <th colspan="1">Description</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> Biggest Bust </td>
                  <td><%= stat_tracker.biggest_bust(season) %></td>
                  <td> Team with the biggest decrease between regular season and postseason win percentage </td>
                </tr>
                <tr>
                  <td> Biggest Surprise </td>
                  <td><%= stat_tracker.biggest_surprise(season) %></td>
                  <td> Team with the biggest increase between regular season and postseason win percentage </td>
                </tr>
                <tr>
                  <td> Winningest Coach </td>
                  <td><%= stat_tracker.winningest_coach(season) %></td>
                  <td> Coach with the best win percentage </td>
                </tr>
                <tr>
                  <td> Worst Coach </td>
                  <td><%= stat_tracker.worst_coach(season) %></td>
                  <td> Coach with the worst win percentage </td>
                </tr>
                <tr>
                  <td> Most Accurate Team </td>
                  <td><%= stat_tracker.most_accurate_team(season) %></td>
                  <td> Team with the best ratio of shots to goals </td>
                </tr>
                <tr>
                  <td> Least Accurate Team </td>
                  <td><%= stat_tracker.least_accurate_team(season) %></td>
                  <td> Team with the worst ratio of shots to goals </td>
                </tr>
                  <td> Most Tackles </td>
                  <td><%= stat_tracker.most_tackles(season) %></td>
                  <td> Team with the most tackles </td>
                </tr>
                </tr>
                  <td> Fewest Tackles </td>
                  <td><%= stat_tracker.fewest_tackles(season) %></td>
                  <td> Team with the fewest tackles</td>
                </tr>
              </tbody>
            </table>
          <% end %>
        </body>
      </html>
    }
  end

end
