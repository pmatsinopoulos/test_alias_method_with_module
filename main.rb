module Benchmarkable
  def valid_ldap_authentication
    puts "(old) valid ldap authentication on Benchmarkable"
  end
end

module Devise
  module Models
    module LdapAuthenticatable
      include Benchmarkable
     alias_method :old_valid_ldap_authentication, :valid_ldap_authentication

      def valid_ldap_authentication
        puts "(new) valid ldap authentication on ldap authenticable"
        old_valid_ldap_authentication
      end
    end
  end
end

class Cls
  include Devise::Models::LdapAuthenticatable

  def do_something_new
    valid_ldap_authentication
  end

  def do_something_old
    old_ldap_authentication
  end
end

c = Cls.new
c.do_something_new
c.do_something_old

