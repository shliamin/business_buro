require_relative 'topurls'
require_relative 'controller'
require_relative 'router'

CSV_FILE = File.join(File.dirname(__FILE__), 'results.csv')
topurls = Topurls.new(CSV_FILE)
controller = Controller.new(topurls)

router = Router.new(controller)

# Start the app
router.run
