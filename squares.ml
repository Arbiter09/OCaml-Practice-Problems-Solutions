(*Consider the one-line list comprehension in Python: (6)
squares = [x * x for x in range(10) if x % 2 == 0]
Write a similar one-line OCaml code to define squares, so that it is a list of squares of even numbers
from 0 to 9. You may want to look at the List.init function.*)


let squares = List.filter (fun x -> x mod 2 = 0) (List.init 10 (funx -> x))
|> List.map (fun x -> x * x);;

(*
○ List.init 10 (fun x -> x): Generates numbers 0-9.
○ List.filter (fun x -> x mod 2 = 0): Keeps only even numbers.
○ List.map (fun x -> x * x): Computes squares.
*)