solution = <<HEREDOC
       W
       S      MDSNAIO
       I      R
       G      H
ARNUISEOATC   L   R
     RSACEERH A   D
       H    HNSILUTVLE
       N      A   N
       T      L   E
       N          S
                  O
                  E
HEREDOC

solution_lines = solution.split("\n")
puzzle_width = solution_lines.map{|line| line.length}.max

puzzle_lines = []

solution_lines.each_with_index do |solution_line, i|
  puzzle_line = ""
  puzzle_width.times do |j|
    if solution_line[j] && solution_line[j] != " "
      entry = solution_line[j]
    else
      entry = ('A'..'Z').to_a.sample
    end
    puzzle_line << "\\node at (#{j},#{solution_lines.length-i-1}) {#{entry}}; "
  end
  puzzle_lines << puzzle_line
end

puts puzzle_lines
