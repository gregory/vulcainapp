class Project
  include Mongoid::Document
  
  #associations
  belongs_to :customer
  has_many :invoices

  attr_accessible :name, :customer_id

  field :name
end

