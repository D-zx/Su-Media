json.extract! budget, :id, :allocateddate, :total, :spent, :balance, :note, :created_at, :updated_at
json.url budget_url(budget, format: :json)
