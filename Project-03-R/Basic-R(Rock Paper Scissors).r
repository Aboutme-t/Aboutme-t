## Main Rock-Paper-Scissors function
play_rps = function() {
  choices = c("paper", "scissor", "rock")
  bot_selected = sample(choices, 1)
  your_selected = tolower(readline("What will you pick? Type 'info' for help "))

  if (your_selected == "info") {
    print("Info: 'rock' 'paper' 'scissor'")
  } else if (your_selected %in% choices) {
    result = get_winner(your_selected, bot_selected)
   win_messages = c("Hooray! You emerged victorious!", "Unexpected win! You're on fire!")
lose_messages = c("Better luck next time! You can do it!", "Defeat! But there's always room for improvement.")
tie_messages = c("A tie! It's a close match.", "No winner, no loser. Interesting!")

    print_result(your_selected, bot_selected, result, win_messages, lose_messages, tie_messages)
  } else {
    print("Invalid choice. Please choose 'rock', 'paper', or 'scissor'.")
  }
}

## Function to determine the winner
get_winner = function(your_selected, bot_selected) {
  if (your_selected == bot_selected) {
    return("tie")
  } else if (
    (your_selected == "rock" && bot_selected == "scissor") ||
    (your_selected == "paper" && bot_selected == "rock") ||
    (your_selected == "scissor" && bot_selected == "paper")
  ) {
    return("win")
  } else {
    return("lose")
  }
}

## Function to print the result
print_result = function(your_selected, bot_selected, result, win_messages, lose_messages, tie_messages) {
  cat("You chose:", your_selected, "\n")
  cat("Bot chose:", bot_selected, "\n")

  if (result == "win") {
    print(sample(win_messages, 1))
  } else if (result == "lose") {
    print(sample(lose_messages, 1))
  } else {
    print(sample(tie_messages, 1))
  }
}

# Run to play rps
play_rps()
