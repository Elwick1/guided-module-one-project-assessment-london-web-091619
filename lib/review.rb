class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    # def game_name
    #     self.game.name
    # end

    def data
      "Game: #{self.game.name}
      Content: #{self.content}
      Rating: #{self.rating}
      \n"
    end

    # def self.review_ratings
    #   all.map do |review|
    #     review.rating
    #   end
    # end

    #   def self.average
    #     ratings_list = Review.review_ratings.sum do |rating|
    #       rating 
    #     end
    #     return ratings_list.to_f/review_ratings.length
    #   end

end


  