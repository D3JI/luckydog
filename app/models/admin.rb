require 'digest/sha1'
class Admin < ActiveRecord::Base
  belongs_to :role
  validates_presence_of :name, :password, :message => '不能为空'
  validates_length_of :name, :within => 3..10, :too_short => '不能少于3个字符', :too_long => '不能超过10个字符'
  validates_uniqueness_of :name, :message => '已经存在'
  validates_confirmation_of :password, :message => '输入的不一致'
  attr_accessor :password_confirmation

  ColumnNames = {
    :name => '用户名', :password => '密码'
  }
  def self.human_attribute_name (attr)
    human_attribute_names = (self.const_defined? "ColumnNames") ? self::ColumnNames : {}
    human_attribute_names[attr.to_sym] || attr.humanize
  end
  def password
    @password
  end

  def password= (pwd)
    @password = pwd
    return if @password.blank?
    create_a_salt
    self.hashed_password = Admin.encrypt_password(self.password, self.salt)
  end

  def self.authenticate(name,password)
    if admin = Admin.find_by_name(name)
      if admin.hashed_password != encrypt_password(password, admin.salt)
        admin = nil
      else
       admin
      end
    end
  end

  private
  def create_a_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  def self.encrypt_password(password,salt)
    string_to_hash = password + 'D3JIADMIN' + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
