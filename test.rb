holiday_hash = {
   :winter => {
     :christmas => ["Lights", "Wreath"],
     :new_years => ["Party Hats"]
   },
   :summer => {
     :fourth_of_july => ["Fireworks", "BBQ"]
   },
   :fall => {
     :thanksgiving => ["Turkey"]
   },
   :spring => {
     :memorial_day => ["BBQ"]
   }
 }

 puts holiday_hash

 def add_supply_to_winter_holidays(holiday_hash, supply)
   # holiday_hash is identical to the one above
   # add the second argument, which is a supply, to BOTH the
   # Christmas AND the New Year's arrays
   holiday_hash.each do |season, event|
     if season == :winter
       event.each do |holiday, supplies|
         supplies << supply
       end
    end
   end
 end

add_supply_to_winter_holidays(holiday_hash, "bells")

puts holiday_hash

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, event|
    puts "#{season.to_s.capitalize}:"
    event.each do |holiday, supplies|
      temp_holiday = holiday.to_s.split("_")
      temp_holiday.each do |h|
        h.capitalize!
      end
      puts "  #{temp_holiday.join(' ')}: #{supplies.join(', ')}"
    end
  end
end

all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, event|
    event.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq_holidays << holiday
      end
    end
  end
  return bbq_holidays
end

def all_holidays_with_bbq2(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |season, event|
    event.collect do |holiday, supplies|
      if supplies.include?("BBQ")
        holiday
      end
    end
  end
end


puts all_holidays_with_bbq(holiday_hash)
puts all_holidays_with_bbq2(holiday_hash)
