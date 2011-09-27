# == Schema Information
#
# Table name: books
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  author      :string(255)
#  total_pages :integer
#  read_pages  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Book < ActiveRecord::Base
  attr_accessible :title, :author, :total_pages, :read_pages

  validates :title, :presence => true

  validates :author, :presence => true

  validates_numericality_of :total_pages,
                            :greater_than => 0

  validates_numericality_of :read_pages,
                            :equal_to => 0,
                            :on => :create

  validates_numericality_of :read_pages,
                            :less_than_or_equal_to => :total_pages,
                            :on => :update
end
