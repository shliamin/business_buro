class Result
  attr_reader :url, :agr, :sqi

  def initialize(attributes = {})
    @url = attributes[:url]
    @agr = attributes[:agr]
    @sqi = attributes[:sqi]
  end

end
