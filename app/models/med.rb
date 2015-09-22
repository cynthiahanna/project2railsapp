class Med < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  before_save :default_values

  # def self.get_med(med)

  #   med = med

  #   response = HTTParty.get "https://rxnav.nlm.nih.gov/REST/drugs?name=#{med}"

  #   response.first[1]
    # med_name = response["rxnormdata"]["drugGroup"]["name"]

      # med_description = response["rxnormdata"]["drugGroup"]["conceptGroup"][1]["conceptProperties"].each do |med|
      #     puts med["name"]
      # end
  end

  def default_values
    # self.completed ||= false
    # nil                           # required so that TX will not rollback!!!
  end
