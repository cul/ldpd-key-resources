# require 'ipaddr'
# require 'resolv'

class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :omniauthable, omniauth_providers: Devise.omniauth_configs.keys

  serialize :affils, Array

  # # devise requires that a password getter and setter be defined
  # # instead of defining bogus methods below, just use this.
  # attr_accessor :password

  validates :uid, uniqueness: true, presence: true

  before_validation(:default_email, on: :create)
  # before_validation(:generate_password, on: :create)
  before_create :set_personal_info_via_ldap

  def to_s
    email
  end

  def name
    [first_name, last_name].join(' ')
  end

  # Password methods required by Devise.
  def password
    Devise.friendly_token[0,20]
  end

  def password=(*val)
    # NOOP
  end

  private

  def default_email
    mail = "#{self.uid}@columbia.edu"
    self.email = mail
  end

  # def generate_password
  #   self.password = SecureRandom.base64(8)
  # end

  def set_personal_info_via_ldap
    if uid
      entry = Net::LDAP.new(host: 'ldap.columbia.edu', port: 389).search(base: 'o=Columbia University, c=US', filter: Net::LDAP::Filter.eq('uid', uid)) || []
      entry = entry.first

      if entry
        _mail = entry[:mail].to_s
        if _mail.length > 6 and _mail.match(/^.+@.+$/)
          self.email = _mail
        else
          self.email = uid + '@columbia.edu'
        end
        if User.column_names.include? 'last_name'
          self.last_name = entry[:sn].to_s.delete('[').delete(']').delete('"')
        end
        if User.column_names.include? 'first_name'
          self.first_name = entry[:givenname].to_s.delete('[').delete(']').delete('"')
        end
      end
    end

    self
  end
end
