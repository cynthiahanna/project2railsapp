# require 'httparty'

# class Drug
#   def self.get_drug(drug)

#     drug = drug

#     response = HTTParty.get "https://rxnav.nlm.nih.gov/REST/drugs?name=#{drug}"

#     drug_name = response["rxnormdata"]["drugGroup"]["name"]

#     puts drug_name

#       drug_description = response["rxnormdata"]["drugGroup"]["conceptGroup"][1]["conceptProperties"].each do |drug|
#           puts drug["name"]
#       end
#   end
# end


# puts "Enter a drug:"
# user_input = gets.chomp

# Drug.get_drug(user_input)
