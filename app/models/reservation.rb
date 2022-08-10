class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :people, presence: true
  validates :total_price, presence: true
  validate :after_today
    def after_today 
      unless start_day == nil
      errors.add(:start_day,"今日を含む過去の日付を入力して下さい")if start_day < Date.today
      end
    end
  validate :after_start
    def after_start
      unless finish_day == nil || start_day ==  nil
      errors.add(:finish_day,"開始日以降の日付を入力してください")if finish_day <= start_day
      end
    end
end
 