class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.date :worked_on, null: false
      t.time :started_at
      t.time :finished_at
      t.time :break_started_at
      t.time :break_finished_at
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
