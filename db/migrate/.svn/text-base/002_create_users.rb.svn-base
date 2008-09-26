class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username,        :string
      t.column :hashed_password, :string
      t.column :salt,            :string
    end
    #-----Insert Data into table----------------
    #-----password is 1234----
    execute "insert into users
             (username,hashed_password,salt) 
             values
             ('ceburb','8f3013c2cf849046850dc7dbcdf18a173909a2e3','181331500.921670100259385') "
  end

  def self.down
    drop_table :users
  end
end
