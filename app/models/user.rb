class User < ActiveRecord::Base
  #allows for user messages
  include Mailboxer::Models::Messageable
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # allows for user ratings
  has_reputation :votes, source: :user, aggregated_by: :average

  has_many :products, dependent: :destroy

  def name
  	return [first_name, last_name].join(' ')
  end

  def mailboxer_email(object)
    email
  end 
end
