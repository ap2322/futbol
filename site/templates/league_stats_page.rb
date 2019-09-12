module LeagueStatsPage
  
  def league_stats_table
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
