## Pizza Bot
order_pizza <- function() {
## Clear the console
flush.console()

## Get the user's name
username <- readline("What is your name? ")

## Get the user's pizza type
pizza_type <- readline("What type of pizza do you want? (Select from cheese, pepperoni, or veggie) ")

## the pizza type
if (pizza_type != "cheese" && pizza_type != "pepperoni" && pizza_type != "veggie") {
  print("Invalid pizza type. Please try again.")
  stop()
}

## Get the user's pizza size
pizza_size <- readline("What size pizza do you want? (Small, medium, or large) ")

## the pizza size
if (pizza_size != "small" && pizza_size != "medium" && pizza_size != "large") {
  print("Invalid pizza size. Please try again.")
  stop()
}

## Calculate the price of the pizza
pizza_price <- ifelse(pizza_size == "small", 199,
               ifelse(pizza_size == "medium", 299,
               ifelse(pizza_size == "large", 399, NA)))

## Confirm the order with the user
print(paste("Your order is:", pizza_type, "pizza, size", pizza_size, "for", pizza_price, "baht."))
confirmation <- readline("Do you want to confirm your order? (y/n) ")

## If the user confirms the order, print a confirmation message and the user's order and sum of order
if (confirmation == "y") {
  print("Your order has been confirmed.")
  print("## User's order")
  print(paste("Pizza type:", pizza_type))
  print(paste("Pizza size:", pizza_size))
  print(paste("Pizza price:", pizza_price, "baht"))
  print("## Sum of order")
  print(paste("Total price:", pizza_price, "baht"))
} else {
  print("Your order has been canceled.")
}
}

## Start order pizza
order_pizza()
