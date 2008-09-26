class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.column :title,       :string
      t.column  :summary,    :text
      t.column :description, :text
      t.column :url_link,    :string
      t.column :author,      :string
      t.column :timeframe,   :text
      t.column :created_at,  :timestamp
    end
  end

  def self.down
    drop_table :projects
  end
end
