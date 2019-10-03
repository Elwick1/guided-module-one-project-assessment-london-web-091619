class Game < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def self.all_names
        all.map { |game| game.name }
      end

      # def self.all_descriptions
      #   all.map { |game| game.description }
      # end

end
