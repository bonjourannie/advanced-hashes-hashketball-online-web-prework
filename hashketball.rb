hashketball = {
  :home => {
    :team_name => "Monstars",
    :colors => ["black", "green"],
    :players => {
      
      "Pound" => {
        :number => 99,
        :shoe_size => 10,
        :stats => {
          :points => 40,
          :rebounds => 11,
          :assists => 12,
          :steals => 8,
          :blocks => 9,
          :slam_dunks => 6
        }
      },

      "Bupkus" => {
        :number => 95,
        :shoe_size => 11,
        :stats => {
          :points => 32,
          :rebounds => 16,
          :assists => 8,
          :steals => 12,
          :blocks => 15,
          :slam_dunks => 8
        }
      },

      "Bang" => {
        :number => 93,
        :shoe_size => 12,
        :stats => {
          :points => 24,
          :rebounds => 9,
          :assists => 13,
          :steals => 10,
          :blocks => 6,
          :slam_dunks => 3
        }
      },

      "Blanko" => {
        :number => 88,
        :shoe_size => 14,
        :stats => {
          :points => 10,
          :rebounds => 12,
          :assists => 8,
          :steals => 6,
          :blocks => 4,
          :slam_dunks => 0
        }
      },

      "Nawt" => {
        :number => 85,
        :shoe_size => 13,
        :stats => {
          :points => 18,
          :rebounds => 4,
          :assists => 10,
          :steals => 3,
          :blocks => 9,
          :slam_dunks => 7
        }
      },
    },
  },
  :away => {
    :team_name => "Toon Squad",
    :colors => ["white", "blue"],
    :players => {
      
      "Bugs" => {
        :number => 1,
        :shoe_size => 10,
        :stats => {
          :points => 30,
          :rebounds => 13,
          :assists => 10,
          :steals => 10,
          :blocks => 8,
          :slam_dunks => 5
        }
      },

      "Babs" => {
        :number => 3,
        :shoe_size => 6,
        :stats => {
          :points => 22,
          :rebounds => 13,
          :assists => 8,
          :steals => 10,
          :blocks => 12,
          :slam_dunks => 3
        }
      },

      "Taz" => {
        :number => 5,
        :shoe_size => 5,
        :stats => {
          :points => 28,
          :rebounds => 7,
          :assists => 15,
          :steals => 4,
          :blocks => 8,
          :slam_dunks => 0
        }
      },

      "Daffy" => {
        :number => 7,
        :shoe_size => 15,
        :stats => {
          :points => 14,
          :rebounds => 12,
          :assists => 8,
          :steals => 6,
          :blocks => 10,
          :slam_dunks => 3
        }
      },

      "Jordan" => {
        :number => 23,
        :shoe_size => 12,
        :stats => {
          :points => 40,
          :rebounds => 8,
          :assists => 4,
          :steals => 12,
          :blocks => 10,
          :slam_dunks => 12
        }
      },
    },
  }
}

# Using the power of Ruby, and the Hashes you created above, answer the following questions:
# Return the number of points scored for any player:

def points_per_player(player, hashketball)
  player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:stats][:points]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:stats][:points]
  else
   "No player found."
  end
end

puts points_per_player("blanko", hashketball)

#

# Return the shoe size for any player:

def player_shoe_size(player, hashketball)
  player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:shoe_size]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:shoe_size]
  else
   "No player found."
  end
end

puts player_shoe_size("taz", hashketball)


#

# Return both colors for any team:

def team_colors(team, hashketball)
  sym = team.to_sym
  if hashketball.include?(sym)
   hashketball[sym][:colors]
  else
   "Try home or away."
  end
end

puts team_colors("away", hashketball)

#

# Return both teams names:

def team_names(hashketball)
  puts "The #{hashketball[:home][:team_name]} welcome the #{hashketball[:away][:team_name]}"
  puts 
end

puts team_names(hashketball)

#

# Return all the player numbers for a team:

def player_nums(team, hashketball)
    sym = team.to_sym
    player_numbers = []
    
      hashketball[sym][:players].each_value do |x|
      player_numbers << x[:number]
  end
    player_numbers
end

puts player_nums("away", hashketball)


# Return all the stats for a player:

def player_stats(player_name, hashketball)
  player_name.capitalize!
  if hashketball[:home][:players].include?(player_name)
    hashketball[:home][:players][player_name][:stats]
  elsif hashketball[:away][:players].include?(player_name)
    hashketball[:away][:players][player_name][:stats]
  else
    "No player found."
  end
end

puts player_stats("Daffy", hashketball)

#

# Return the rebounds for the player with the largest shoe size

def biggest_shoe(hashketball)
  player_number_with_biggest_shoe = ""
  biggest_shoe_size = 0
  
  hashketball[:home][:players].each do |name, player|
    if player[:shoe_size] > biggest_shoe_size
      player_number_with_biggest_shoe = name
      biggest_shoe_size = player[:shoe_size]
    end
  end
  hashketball[:away][:players].each do |name, player|
    if player[:shoe_size] > biggest_shoe_size
      player_number_with_biggest_shoe = name
      biggest_shoe_size = player[:shoe_size]
    end
  end
  
  " #{player_number_with_biggest_shoe} : #{biggest_shoe_size} "
end

puts biggest_shoe(hashketball)