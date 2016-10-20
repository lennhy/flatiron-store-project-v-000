class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user
  before_create :set_value

  validates :item, presence: true


  def set_value
    self.items ||= 0
  end
end
