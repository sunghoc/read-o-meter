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

require 'spec_helper'

describe Book do

  before(:each) do
    @attr = {
        :title => "Example Title",
        :author => "Example Author",
        :total_pages => 350,
        :read_pages => 0
    }

  end

  it "should create a new instance  given valid attributes" do
    Book.create!(@attr)
  end

  it "should require title" do
    no_title_book = Book.new(@attr.merge(:title => ""))
    no_title_book.should_not be_valid
  end

  it "should require author" do
    no_author_book = Book.new(@attr.merge(:author => ""))
    no_author_book.should_not be_valid
  end

  it "should have at least 1 total page" do
    invalid_total_pages = 0
    invalid_total_pages_book = Book.new(@attr.merge(:total_pages => invalid_total_pages))
    invalid_total_pages_book.should_not be_valid
  end

  it "should have 0 read page initially" do
    invalid_read_pages = 100
    invalid_read_pages_book = Book.new(@attr.merge(:read_pages => invalid_read_pages))
    invalid_read_pages_book.should_not be_valid
  end

end
