class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :memo
      t.string :author

      t.timestamps
    end
  end
end
