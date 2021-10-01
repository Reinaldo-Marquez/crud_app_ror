class CreateChampions < ActiveRecord::Migration[6.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :region
      t.string :rol
      t.string :comp

      t.timestamps
    end
  end
end
