class User < ApplicationRecord
  def fight(user_id)
    user = User.find(user_id)
    winner_id = fighting_capacity >= user.fighting_capacity ? id : user.user_id
    FightRecord.create(
      winner_id: winner_id,
      fight_1_id: id,
      fight_2_id: user.id,
      fight_info: {
        fight_1_fighting_capacity: fighting_capacity,
        fight_2_fighting_capacity: user.fighting_capacity
      }
    )
  end
end
