#By using symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name			"Michael Hartl"
  user.email			"mhartl@example.com"
  user.password			"foobar"
  user.password_confirmation	"foobar"
end

Factory.define :book do |book|
  book.title        "Harry Potter"
  book.author       "J.K. Rowling"
  book.total_pages  300
  book.read_pages   0
end