module TeamStat

  def team_info(team_id)
    team_info_hash = {
      "team_id" => team_id,
      "franchise_id" => all_teams[team_id].franchise_id,
      "team_name" => all_teams[team_id].team_name,
      "abbreviation" => all_teams[team_id].abbreviation,
      "link" => all_teams[team_id].link
    }
  end
end
