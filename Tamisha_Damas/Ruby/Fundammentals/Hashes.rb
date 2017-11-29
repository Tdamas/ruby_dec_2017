# def hash()
# h = {:first_name => "Coding", :last_name => "Dojo"}
# h.delete(:last_name)
# p h[:first_name]# => {:first_name => "Coding"}
# end
# hash()

# def our_h()
# our_hash = {:first_name => "Coding", :last_name => "Dojo"}
# p our_hash[:first_name]
# end
# our_h()


# def new_user user = {first_name: "first", last_name: "last"}
#   puts "Welcome to our site, #{user[:first_name]} #{user[:last_name]}!"
# end
# our_user = {first_name: 'Oscar', last_name: "Vazquez"}
# new_user # => "Welcome to our site, first last!"
# new_user our_user # => "Welcome to our site, Oscar Vasquez!"

# def new_user first_name: "first", last_name: "last"
#   puts "Welcome to our site, #{first_name} #{last_name}!"
# end
# new_user
#
# def new_user greeting="Welcome", first_name: "first", last_name: "last"
#     puts "#{greeting}, #{first_name} #{last_name}"
# end
# our_user = {first_name: "Oscar", last_name: "Vazquez"}
# new_user                  # => Welcome, first last
# new_user "Hello", our_user # => Hello, Oscar Vazquez

def student wel_message="Welcome to the Coding Dojo,", stu_first: "first", stu_last: "last"
  puts "#{wel_message} #{stu_first} #{stu_last}"
end

user1 = {stu_first: "Jane", stu_last: "Doe"}
puts user1.empty?
puts user1.has_key?(:stu_last)
puts user1.delete(:stu_last)
puts user1.has_value?("Jane")
