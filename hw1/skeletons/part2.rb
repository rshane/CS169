class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  m1 = m1.capitalize
  m2 = m2.capitalize
  champ =
    {
    'R' => {'R' => 0, 'P' => 1, 'S' => 0},
    'P' => {'R' => 0, 'P' => 0, 'S' => 1},
    'S' => {'R' => 1, 'P' => 0, 'S' => 0}
  }
  champ[m1][m2]
end

def rps_game_winner(game)
  if game.length != 2
    raise WrongNumberOfPlayersError
  end
  game.each do |player|
    if player[1] !~ /R|S|P/i
      puts "player1" + player[1]
      raise NoSuchStrategyError
    end
  end
  champ = game[rps_result(game[0][1], game[1][1])]
end

def rps_tournament_winner(tournament)
  if tournament[0][0].class == String
    return rps_game_winner(tournament)
  else
    winner = rps_tournament_winner(tournament.shift)
    tournament << winner
    rps_tournament_winner(tournament)
  end
end

=begin
#TEST
puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ] ).to_s
puts rps_game_winner([ [ "Armando", "R" ], [ "Dave", "R" ] ] ).to_s
puts rps_game_winner([ [ "Armando", "S" ], [ "Dave", "S" ] ] ).to_s
puts rps_game_winner([ [ "Armando", "S" ], [ "Dave", "P" ] ] ).to_s


puts rps_tournament_winner([
[
  [ ["Armando", "P"], ["Dave", "S"] ],
  [ ["Richard", "R"],  ["Michael", "S"] ],
],
[
  [ ["Allen", "S"], ["Omer", "P"] ],
  [ ["David E.", "R"], ["Richard X.", "P"] ]
]
]).to_s


game = [ ["Armando", "P"], ["Dave", "S"] ]
smalltour =
  [
   [ ["Armando", "P"], ["Dave", "S"] ],
   [ ["Richard", "R"],  ["Michael", "S"] ],
  ]

tour =
  [
   [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richards", "R"],  ["Michael", "S"] ],
   ],
   [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "R"] ]
   ]
  ]

megatour =
  [
   [
    [
     [ ["Armando", "S"], ["Dave", "S"] ],
     [ ["Richard", "S"],  ["Michael", "S"] ],
    ],
    [
     [ ["Allen", "S"], ["Omer", "P"] ],
     [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
   ],
   [
    [
     [ ["Armandoy", "P"], ["Davey", "S"] ],
     [ ["Richardy", "R"],  ["Michaely", "S"] ],
    ],
    [
     [ ["Alleny", "P"], ["Omery", "P"] ],
     [ ["David E.y", "R"], ["Richard X.y", "P"]]
    ]
   ]
  ]



puts "game: " + rps_game_winner(game).inspect
puts "one game tournament: " + rps_tournament_winner(game).inspect
puts "smalltour: " + rps_tournament_winner(smalltour).inspect
puts "tour: " + rps_tournament_winner(tour).inspect
puts "mega_tour: " + rps_tournament_winner(megatour).inspect
=end
