class Machine < ApplicationRecord
    validates :tweet_id, uniqueness: true
end
