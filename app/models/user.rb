class User < ApplicationRecord
    has_many :posts
    has_many :reviews
end
