game = {
  :team1 => {
    :name => "The Ragin' Cajuns",
    :colors => ["red", "yellow"],
    :players => {
      :player1 => {
        :name => "Mike DeLaRosa",
        :number => 45,
        :shoe_size => 12,
        :stats => {
          :points => 12,
          :rebounds => 4,
          :assists => 2,
          :steals => 0,
          :blocks => 0,
          :slam_dunks => 6
        }
      },
      :player2 => {
        :name => "Bill Nye",
        :number => 12,
        :shoe_size => 11,
        :stats => {
          :points => 28,
          :rebounds => 9,
          :assists => 0,
          :steals => 0,
          :blocks => 0,
          :slam_dunks => 10
        }
      },
      :player3 => {
        :name => "Conor Walsh",
        :number => 15,
        :shoe_size => 10,
        :stats => {
          :points => 4,
          :rebounds => 4,
          :assists => 6,
          :steals => 4,
          :blocks => 9,
          :slam_dunks => 1
        }
      },
      :player4 => {
        :name => "James Blake",
        :number => 67,
        :shoe_size => 12,
        :stats => {
          :points => 0,
          :rebounds => 1,
          :assists => 0,
          :steals => 1,
          :blocks => 4,
          :slam_dunks => 0
        }
      },
      :player5 => {
        :name => "Ernest Feinhorn",
        :number => 52,
        :shoe_size => 11,
        :stats => {
          :points => 8,
          :rebounds => 1,
          :assists => 1,
          :steals => 0,
          :blocks => 2,
          :slam_dunks => 1
        }
      }
    }
  },
  :team2 => {
    :name => "The Mile High Skyscrapers",
    :colors => ["blue", "white"],
    :players => {
      :player1 => {
        :name => "Al Gore",
        :number => 4,
        :shoe_size => 15,
        :stats => {
          :points => 3,
          :rebounds => 4,
          :assists => 5,
          :steals => 1,
          :blocks => 0,
          :slam_dunks => 0
        }
      },
      :player2 => {
        :name => "King George",
        :number => 55,
        :shoe_size => 11,
        :stats => {
          :points => 18,
          :rebounds => 4,
          :assists => 4,
          :steals => 1,
          :blocks => 3,
          :slam_dunks => 4
        }
      },
      :player3 => {
        :name => "Michael Giordan",
        :number => 23,
        :shoe_size => 13,
        :stats => {
          :points => 0,
          :rebounds => 0,
          :assists => 0,
          :steals => 0,
          :blocks => 0,
          :slam_dunks => 0
        }
      },
      :player4 => {
        :name => "Guy Smith",
        :number => 68,
        :shoe_size => 10,
        :stats => {
          :points => 23,
          :rebounds => 7,
          :assists => 9,
          :steals => 0,
          :blocks => 0,
          :slam_dunks => 9
        }
      },
      :player5 => {
        :name => "Billie Vacation",
        :number => 32,
        :shoe_size => 12,
        :stats => {
          :points => 18,
          :rebounds => 12,
          :assists => 3,
          :steals => 7,
          :blocks => 0,
          :slam_dunks => 5
        }
      }
    }
  }
}

# Using the power of Ruby, and the Hashes you created above, answer the following questions:
# Return the number of points scored for any player:
#
def points_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats][:points]
      end
    end
  end
end

p points_of_player("Michael Giordan", game)

# Return the shoe size for any player:
#
def shoe_size_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:shoe_size]
      end
    end
  end
end

p shoe_size_of_player("King George", game)

# Return both colors for any team:
#
def team_colors(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:colors].collect do |color|
        color
      end)
    end
  end
end

p team_colors("The Ragin' Cajuns", game)

# Return both teams names:
#
def team_names(game)
  game.collect do |team, team_hash|
    team_hash[:name]
  end
end

p team_names(game)

# Return all the player numbers for a team:
#
def all_team_players(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:players].collect do |player, player_hash|
        player_hash[:name]
      end)
    end
  end
end

p all_team_players("The Ragin' Cajuns", game)

# Return all the stats for a player:
#
def all_stats_for_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats]
      end
    end
  end
end

p all_stats_for_player("Bill Nye", game)

# Return the rebounds for the player with the largest shoe size
#
def rebounds_for_largest_shoe_size(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:shoe_size] > max_player[:shoe_size]
    end
  end

  max_player[:stats][:rebounds]
end

p rebounds_for_largest_shoe_size(game)

# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
#
def player_with_most_points(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:points] > max_player[:stats][:points]
    end
  end

  max_player[:name]
end

p player_with_most_points(game)

# Which team has the most points?
#
def team_with_most_points(game)
  max_team = nil
  game.each do |team, team_hash|
    sum = 0
    team_hash[:players].each do |player, player_hash|
      sum += player_hash[:stats][:points]
    end

    team_hash[:sum] = sum
    max_team ||= team_hash
    max_team = team_hash if team_hash[:sum] > max_team[:sum]
  end

  max_team[:name]
end

p team_with_most_points(game)

# Which player has the longest name?
#
def player_with_longest_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:name].length > max_player[:name].length
    end
  end

  max_player[:name]
end

p player_with_longest_name(game)

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:
#
def player_with_most_steals_and_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:steals] > max_player[:stats][:steals]
    end
  end

  max_player[:name] == player_with_longest_name(game)
end

p player_with_most_steals_and_name(game)