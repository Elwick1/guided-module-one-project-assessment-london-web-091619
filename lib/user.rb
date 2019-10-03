class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews

    def all_review_data
      self.reviews.map do |review|
        "\n
        Game: #{review.game.name}
        Content: #{review.content}
        Rating: #{review.rating}
        \n"
      end
    end

    def map_reviews
      self.reviews.map do |review|
        review.content
      end
    end

end 