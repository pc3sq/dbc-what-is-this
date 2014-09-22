class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :image_path
      t.string :title
      t.string :slug
      t.references :user, index: true
      t.references :response

      t.timestamps
    end
  end
end
