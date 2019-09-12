module Templates
  def template_1()
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

  def table
    %{
  <html>
    <body>
    <table>
      <thead>
        <tr>
        <th colspan="2">Teams</th>
        </tr>
      </thead>
        <tbody>
        <% all_teams.each do |team_id, team| %>
          <tr>
          <td><%= team.team_name %></td>
          <td><%= stat_tracker.average_win_percentage(team_id) %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
    </body>
  </html>
    }
  end

end
