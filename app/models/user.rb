class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  sample_filter(
    email: {type: :string},
    created_at: {type: :date},
    sort: {type: :sorting, values: [:email, :created_at], default_value: 'created_at_desc'}
  )
end
