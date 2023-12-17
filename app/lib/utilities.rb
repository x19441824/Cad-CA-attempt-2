module Utilities
    #Creates a public method that can be called anywhere
    def self.format_date(date)
      date.strftime("%d/%m/%Y")
    end
end