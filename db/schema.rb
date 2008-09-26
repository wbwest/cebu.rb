# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 6) do

  create_table "articles", :force => true do |t|
    t.column "title",        :string
    t.column "description",  :text
    t.column "author",       :string
    t.column "date_created", :datetime
  end

  create_table "comments", :force => true do |t|
    t.column "name",       :string
    t.column "message",    :string
    t.column "created_at", :datetime
    t.column "project_id", :integer,  :null => false
  end

  create_table "projects", :force => true do |t|
    t.column "title",       :string
    t.column "summary",     :text
    t.column "description", :text
    t.column "url_link",    :string
    t.column "author",      :string
    t.column "timeframe",   :text
    t.column "created_at",  :datetime
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "username",        :string
    t.column "hashed_password", :string
    t.column "salt",            :string
  end

end
