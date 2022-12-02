class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :heading
      t.text :data

      t.timestamps
    end
  end
end
