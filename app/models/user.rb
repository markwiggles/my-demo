class User < ActiveRecord::Base
before_save { self.email = email.downcase }


validates :name, presence: true, length: {maximum: 50}

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX }

# SEE http://www.rubular.com/

validates :password, length: {minimum: 6}

has_secure_password
end

# has_secure_password
#####################
# When included in a model as above, this one method adds the following functionality:
# • Theabilitytosaveasecurelyhashedpassword_digestattributetothe database
# • A pair of virtual attributes18 (password and password_confirma- tion),
# including presence validations upon object creation and a valida- tion requiring that they match
# • An authenticate method that returns the user when the password is correct (and false otherwise)
# The only requirement for has_secure_password to work its magic is for the
# corresponding model to have an attribute called password_digest.
