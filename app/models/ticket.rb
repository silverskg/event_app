class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, count_cahce: :tickets_count
# counter_cahce: :tickets_countはリレーションされているticketの数の値をリレーション先のtickets_countというカラムの値に入れるという意味
  validates :comment, length: { maximum:30 }, allow_blank: true
end
