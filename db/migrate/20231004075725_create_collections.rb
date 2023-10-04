class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :title, null: false, default: ""
      t.text :description
      t.string :image_path
      t.boolean :published, null: false, default: false

      t.timestamps
    end

    create_table :collection_memberships, id: false do |t|
      t.belongs_to :collection, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
