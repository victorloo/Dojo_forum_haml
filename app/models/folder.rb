class Folder < ApplicationRecord
  belongs_to :category
  belongs_to :post
end
