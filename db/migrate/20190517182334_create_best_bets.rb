class CreateBestBets < ActiveRecord::Migration[6.0]
  def change
    create_table :best_bets do |t|
      t.string :title
      t.string :url
      t.string :description
      t.text :keywords
      t.text :tags
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
