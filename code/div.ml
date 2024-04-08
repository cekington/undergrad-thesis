let div (a : int) (b : int) : int option =
  try
    Some (a / b)
  with Failure _ -> print_endline "Division by zero"; None