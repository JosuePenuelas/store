class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.string :client_name

      t.timestamps
    end
  end
end
