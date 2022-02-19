class CreateRailswikis < ActiveRecord::Migration[6.1]
  def change
    create_table :railswikis do |t|
      t.string :title
      t.text :content
      t.string :wiki_url
      t.string :wiki_tag

      t.timestamps
    end
  end
end
