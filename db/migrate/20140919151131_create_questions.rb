class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :image_path
      t.string :title
      t.text :caption
      t.string :slug
      t.references :user, index: true

      t.timestamps
    end
  end
end
