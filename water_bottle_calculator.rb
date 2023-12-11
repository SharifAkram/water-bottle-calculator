# A calculator to determine how many bottles of water to drink based
# on your weight in lbs or kg
# A standard single-use plastic water bottle holds 16.9 ounces of water
# and is made of 0.3 ounces of plastic.

class WaterBottleCalculator
      def calculate_bottles(weight, unit)
            weight = Float(weight)
            bottles = 0

            if unit.downcase == 'lbs'
                  # converts lbs into bottles of water
                  bottles = (weight / 2) / 16.9
            elsif unit.downcase == 'kg'
                  # converts kg into bottles of water
                  bottles = ((weight * 2.20462) / 2) / 16.9
            end

            bottles.ceil
      end
end

class Main
      def self.run
            calculator = WaterBottleCalculator.new

            # program will loop until a float is inputted
            weight = nil
            until weight.is_a?(Float)
                  puts "Enter your body weight:"
                  input = gets.chomp

                  begin
                        weight = Float(input)
                  rescue ArgumentError
                        puts "Invalid input. Please enter a valid number for \
weight."
                  end
            end

            # program will loop until lbs or kg is inputted
            unit = nil
            until unit == 'lbs' || unit == 'kg'
                  puts "Enter the unit (lbs or kg):"
                  unit = gets.chomp.downcase
            end

            begin
                  bottles = calculator.calculate_bottles(weight, unit)
                  # return value does not have .0
                  formatted_weight = weight.to_i == weight ? weight.to_i : weight
                  puts "You are #{formatted_weight} #{unit}. It is \
recommended that you drink #{bottles} bottles of water \
per day."
            rescue => e
                  puts e.message
            end
      end
end

Main.run
