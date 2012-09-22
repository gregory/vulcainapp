class Customer
 include Mongoid::Document

  has_many :projects

  attr_accessible :name, :email

  field :name
  field :reference
  field :email
  field :vta_ref

end
