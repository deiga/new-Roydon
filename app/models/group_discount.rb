class GroupDiscount < Discount
  field :amount_needed, :type => Integer

  belongs_to :user
end
