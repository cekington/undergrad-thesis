let rec length : 'a list -> int = function
  | [] -> 0
  | _ :: xs -> 1 + length xs