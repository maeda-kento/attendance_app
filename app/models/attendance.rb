class Attendance < ApplicationRecord

  validates :worked_on, presence: true

  def self.create_one_month(one_month, staff_id)
    transaction do
      one_month.each do |worked_on|
        create!(
          worked_on: worked_on,
          staff_id: staff_id
        )
      end
    end
  end

  def work_min
    return unless started_at && finished_at
    (finished_at - started_at) / 60
  end

  def break_min
    return unless break_started_at && break_finished_at
    (break_finished_at - break_started_at) / 60
  end

  def actual_work_min
    return unless work_min && break_min
    work_min - break_min
  end

end
