class Shop < ActiveRecord::Base
  has_many :products
  belongs_to :shop_category
  #validates_uniqueness_of :login_name
  validates_confirmation_of :password

  def password
    @password
  end

  def password= (pwd)
    @password = pwd
    return if @password.blank?
    create_a_salt
    self.hashed_password = Shop.encrypt_password(self.password, self.salt)
  end

  def self.authenticate(login_name,password)
    if  login = Shop.find_by_login_name(login_name)
      if login.hashed_password != encrypt_password(password, login.salt)
         login = nil
      else
         login
      end
    end
  end

  private
  def create_a_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypt_password(password,salt)
    string_to_hash = password + 'D3JI' + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
