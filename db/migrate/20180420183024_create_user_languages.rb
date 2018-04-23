class CreateUserLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_languages do |t|
      t.references :language
      t.references :user
      t.references :skill_level
      t.timestamps
    end
  end
end
