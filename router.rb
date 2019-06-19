class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to the Top URLs!"
    puts "           --           "
    puts "We have a list of 10 URLs from yandex for 'ruby'?"
    puts ""

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list_agr
    when 2 then @controller.list_sqi
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all results based on Alexa Global Rank"
    puts "2 - List all results based on Site Quality Index"
    puts "3 - Stop and exit the program"
    print "> "
  end
end
