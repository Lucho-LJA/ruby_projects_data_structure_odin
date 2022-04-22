class Knight
    attr_reader :location, :parent
    def initialize(data, parent = nil)
      @location = data
      @parent = parent
    end
end


