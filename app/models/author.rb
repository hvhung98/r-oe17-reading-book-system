class Author < ApplicationRecord
  has_many :written_bys
  has_many :books, through :written_by
end
