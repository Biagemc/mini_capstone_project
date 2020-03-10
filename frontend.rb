require "http"

# p "Please type the id you would like to delete"
# user_input = gets.chomp
response = HTTP.get("https://localhost:3000/api/products")
response.parse
