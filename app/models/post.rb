class Post < ApplicationRecord
    validates :title, presence: true,
    length: {minimum: 5}

    has_many :comments

    has_many :passive_likeposts, class_name: "Likepost", foreign_key: "post_id", 
    dependent: :destroy
    
    has_many :postlikers, through: :passive_likeposts, source: :post
    
    acts_as_taggable

    def self.search(title)
        if title.present?
          words = title.split(' ')
          Post.where(
            Array.new(words.length, 'title LIKE ?').join(' OR '),
            *words.map { |word| "%#{word}%" }
          )
        else
          Post.all
        end
      end
end
