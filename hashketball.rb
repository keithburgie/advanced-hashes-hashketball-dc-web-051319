#require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }

    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }

    }
  }
end

def home_team_name
  game_hash[:home][:team_name]
end

def player_search(player_name, key)
  game_hash.each do |location, team_info|
    team_info.each do |keys, values|
      if values.include?(player_name)
          return key = values[player_name][key]
      end
    end
  end
end

def num_points_scored(player_name)
  player_search(player_name, :points)
end

def shoe_size(player_name)
  player_search(player_name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |location, team_info|
    if team_info.values.include?(team_name)
      return colors = team_info[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, team_info|
      names << team_info[:team_name]
  end
  names
end

def player_numbers(team_name)
  jerseyNumbers = []
  game_hash.each do |location, team_info|
      if team_info.values.include?(team_name)
        team_info[:players].each do |player, stat|
            jerseyNumbers << stat[:number]
        end
      end
  end
  jerseyNumbers
end

def player_stats(player_name)
  game_hash.each do |location, team_info|
    team_info.each do |keys, values|
      if values.include?(player_name)
        return values[player_name]
      end
    end
  end
end

def big_shoe_rebounds
    all_players = []
    game_hash.each do |location, team_info|
        team_info[:players].each do |player, stats|
            this_player = { :shoe_size => "#{stats[:shoe]}", :name =>"#{player}", :rebounds =>"#{stats[:rebounds]}" }
            all_players << this_player
        end
    end
    all_players.max_by(&:first)[:rebounds].to_i
end