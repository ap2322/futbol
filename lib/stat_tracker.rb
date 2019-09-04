require 'csv'

class StatTracker

  def self.from_csv(hash)
    # map each line to the first level key
    hash.each do |key, value|
      hash[key] = File.open(value).map do |line|
      line = line.split("\r\n")
    end
    key
  end
    # csv.each
    # create ruby objects
    # CSV.each_row do |row|
    #   # make ruby objects here
    #   end
    # end
    # hash.each do |key, value|
    #   CSV.open(value, 'r', ';') do |row|
    #     hash[key] = row
    #   end
    #   binding.pry
    # end

    # arr_of_arrs = []
    # hash.each do |key, value|
    #   binding.pry
    #   arr_of_arrs << CSV.read(value)
    # end

  end


end
