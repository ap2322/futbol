module GameStatPage
  def game_stats_table
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
end
