def create_customers
  (1..20).each do 
    Customer.create(:name => Faker::Name.name, :email => Faker::Internet.safe_email)
  end
end

def create_projects
 (1..20).each do 
    Project.create(:name => Faker::Name.name)
  end
end

def rand_time(from, to)
  Time.at(rand_in_range(from.to_f, to.to_f)).to_date
end
def rand_in_range(from, to)
  rand * (to - from) + from
end

def create_invoices
  (1..20).each do 
    Invoice.create(
      :title => Faker::Lorem.sentence, 
      :header => Faker::Lorem.paragraph, 
      :footer =>Faker::Lorem.sentences, 
      :issue_date => rand_time(2.month.ago, Time.now),
      :due_date => rand_time(2.month.ago, Time.now)
  )
  end
end

def create_articles
  (1..20).each do |i|
    Article.create(
      :title => Faker::Lorem.sentence, 
      :description => Faker::Lorem.paragraph, 
      :price => i
  )
  end
end
create_projects
create_invoices
create_articles
