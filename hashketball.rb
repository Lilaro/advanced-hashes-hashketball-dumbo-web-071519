require 'pry'

def game_hash
  {
    home: { team_name: 'Brooklyn Nets',
            colors: ['Black', 'White'],
            players: [
              {player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              {player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              {player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              {player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              {player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] },
    away: { team_name: 'Charlotte Hornets',
            colors: ['Turquoise', 'Purple'],
            players: [ 
              {player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              {player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              {player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              {player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              {player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }      
  }
end

def num_points_scored(name_of_player)
  game_hash.each do |location, keys|
    players = keys[:players] 
    players.each do |player_stats|
      player_name = player_stats[:player_name] #DRY this code! Create method to get player_name
      return player_stats[:points] if player_name == name_of_player
    end
  end
end

def shoe_size(name_of_player)
   game_hash.each do |location, keys|
     players = keys[:players]
     players.each do |player_stats|
       player_name = player_stats[:player_name] #DRY
       return player_stats[:shoe] if player_name == name_of_player
     end
   end
 end
 
 def team_colors(name_of_team)
   game_hash.each do |location, keys|
     team_name = keys[:team_name]
     return keys[:colors] if team_name == name_of_team
   end
 end
 
 def team_names
   game_hash.map { |location, keys|
      name_of_team = keys[:team_name]
   }
 end
 
 def player_numbers(team_name)
   game_hash.each do |location, keys|
     tname = keys[:team_name] #new variable to extract team name
     players = keys[:players] #new variable to extract array of player hashes
     player_numbers = players.map { |player| player[:number] } #enumerate through array of players and return array of player numbers
     return player_numbers if tname == team_name
     end
   end

 
 def player_stats(name_of_player)
   game_hash.each do |location, keys|
     players = keys[:players]
     players.each do |player_stats| 
     player_name = player_stats[:player_name] #DRY 
       if player_name == name_of_player
         return player_stats.delete_if { |stat, value| [:player_name].include?(stat)}
        #delete_if enumerates through hash, deleting anything that meets these conditions (deletes :player_name key/value pair), and returns new hash
       end
     end
   end
 end
 
 def big_shoe_rebounds
   biggest_shoe = 0
   rebounds = 0
   game_hash.each do |location, keys|
     players_array = keys[:players] #players = the array of player hashes
    players_array.each do |player_stats_hash|
       size = player_stats_hash[:shoe]
       
        # Example of a player_stats_hash:
        #       { player_name: 'Alan Anderson',
        #        number: 0,
        #        shoe: 16,
        #        points: 22,
        #        rebounds: 12,
        #        assists: 12,
        #        steals: 3,
        #        blocks: 1,
        #        slam_dunks: 1 }
       
       # Home
       # size [5, 3, 2, 6]
       # rebounds: [12, 5, 10, 2]
       
       # Away
       # size [8, 2, 4, 6]
       # rebounds [9, 25, 2, 6]
       
       # if 5 > 0
       # biggest_shoe will equal 5 
       
       # if 3 > 5 <-- won't go into if statement
       
       # if 2 > 5 <--- won't go in
       
       # if 6 > 5
       # biggest_shoe will equal 6
       if size > biggest_shoe 
         biggest_shoe = size
         rebounds = player_stats_hash[:rebounds]
       end
     end
   end
   rebounds
 end

#def num_points_scored(player_name)
  #game_hash.each do |location, team_hash|
   # team_hash.each do |team_key, team_data|
    #  team_data.each do |stats|  
      
      #team_hash[:players][0].keys
      #return player[:points] if player[:player_name] == sought_player_name



