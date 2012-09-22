class Invoice
 include Mongoid::Document
  
  belongs_to :project

  attr_accessible :title, :header, :footer, :issue_date, :due_date, :project_id
  field :reference
  field :title
  field :issue_date, type: Date
  field :due_date, type: Date
  field :header
  field :footer
end
