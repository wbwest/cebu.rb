class User < ActiveRecord::Base
  validates_presence_of   :username #check if username is not null
  validates_uniqueness_of :username #check if username is unique
  
  #checks if password and password confirmation are the same
  attr_accessor             :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Missing Password") if hashed_password.blank?
  end
  
  def self.authenticate(username,password)
    #find login account by the given username
    user = self.find_by_username(username) 
    #if the user is found check if given password is the same in db
    if user 
      expected_password = encrypted_password(password,user.salt)
      #if user's hashed password is not the same with the given password(hashed)
      if user.hashed_password != expected_password 
        user = nil
      end
    end
    user
  end
    
  def after_destroy
    if User.count.zero?
      raise "Can't Delete Remaining User"
    end
  end
  
  
  #password is a virtual attribute since the real attribute is hashed_password 
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  
  #private methods start here
  private 
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(password,salt)
    salted_password = password + 'd43jdjte1' + salt
    Digest::SHA1.hexdigest(salted_password)
  end
  
end
