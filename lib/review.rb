class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :game

    def data
      "Game: #{self.game.name}
      Content: #{self.content}
      Rating: #{self.rating}
      \n"
    end
end


  