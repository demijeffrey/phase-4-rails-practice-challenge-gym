class Membership < ApplicationRecord

    validate :join_gym_once

    belongs_to :client
    belongs_to :gym

    def join_gym_once
        if Membership.find_by(gym_id: self.gym_id, client_id: self.client_id)
            self.errors.add(:client, "cant join gym more than once")
        end
    end

end
