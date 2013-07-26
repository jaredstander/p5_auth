class User < ActiveRecord::Base
  include BCrypt
  # TODO : Use bcrypt to store hashed passwords and authenticate users ==> CHALLENGE ACCEPTED!
  # Resampling my p1 code for some sick remixes. Why reinvent the wheel?
  validates :name, :presence => { :message => "Name required" }
  validates :email, :presence => { :message => "Email required" }
  validates_format_of :email,  with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => "Improper email format"
  validates :password, :presence => { :message => "Password required" }
  validates_length_of :password, :minimum => 6, :message => "Password too short"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  # validates :organizer_name, :presence => { :message => "Your name is required" }
  # validates :organizer_email, :presence => { :message => "Your email is required" }
  # validates_format_of :organizer_email,  with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => "Improper email format"
  # validates :event_name, :presence => { :message => "An event name is required" }, :uniqueness => { :message => "Event name is taken, please choose another" }
  # validate :event_date_cannot_be_in_the_past, :event_date_is_a_date

  # def event_date_is_a_date
  #   if event_date == nil
  #     errors.add(:event_date, "An properly formatted event date is required")
  #     return false
  #   else
  #     return true
  #   end
  # end

  # def event_date_cannot_be_in_the_past
  #   if event_date.present? && event_date < Date.today
  #     errors.add(:event_date, "Event cannot be in the past")
  #     return false
  #   else
  #     return true
  #   end
  # end
end
