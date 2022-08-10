class Relationship
    attr_reader :bug1, :bug2
    attr_accessor :kind
    
    def initialize(kind)
        @kind = kind
    end

    def bug1=(bug1)
        @bug1 = bug1
        @bug1.relationships << self
    end

    def bug2=(bug2)
        @bug2 = bug2
        @bug2.relationships << self
    end

    def description
        puts "#{@bug1.name} is #{@bug2.name}'s #{@kind}"
        "#{@bug1.name} is #{@bug2.name}'s #{@kind}"
    end
end
