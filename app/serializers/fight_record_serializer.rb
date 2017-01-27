class FightRecordSerializer < ActiveModel::Serializer
  attributes :id, :winner_id, :fight_1_id, :fight_2_id, :fight_info
end
