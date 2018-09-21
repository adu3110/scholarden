class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of :email

    has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", 
    dependent: :destroy
    
    has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", 
    dependent: :destroy
    
    has_many :following, through: :active_friendships, source: :followed
    has_many :followers, through: :passive_friendships, source: :follower
    

    def follow(user)
        active_friendships.create(followed_id: user.id)
    end

    def unfollow(user)
        active_friendships.find_by(followed_id: user.id).destroy
    end

    def following?(user)
        following.include?(user)
    end

    has_many :active_likeposts, class_name: "Likepost", foreign_key: "user_id", 
    dependent: :destroy
    
    
    has_many :postliking, through: :active_likeposts, source: :user
    

    def likeapost(post)
        active_likeposts.create(post_id: post.id)
    end

    def unlikeapost(post)
        active_likeposts.find_by(post_id: post.id).destroy
    end

    def postliked?(post)
        active_likeposts.find_by(post_id: post.id)
    end

end
