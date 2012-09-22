class Article
 include Mongoid::Document

  attr_accessible :reference, :title, :description, :price

  field :type
  field :reference
  field :title
  field :description
  field :price

end

