class View
  def display(results)
    results.each_with_index do |result, index|
      puts "#{index + 1}. #{result.url}: #{result.agr} (#{result.sqi})"
    end
  end
end
