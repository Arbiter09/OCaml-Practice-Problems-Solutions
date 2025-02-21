(*A predicate is a function that returns a boolean value. In OCaml, the type of such a function can be (8)
expressed as 'a -> bool.
Write a function remove if of the type 'a list -> ('a -> bool) -> 'a list, which takes a list and
a predicate, and removes all the elements that satisfy the condition expressed in the predicate.
# remove_if [1;2;3;4;5] (fun x -> x mod 2 = 1);;
- : int list = [2; 4]*)

let rec remove_if lst pred =
  match lst with
  | [] -> []
  | x :: xs -> if pred x then remove_if xs pred else x :: remove_if xs pred



(* Test case *)
let _ =
  let test1 = remove_if [1; 2; 3; 4; 5] (fun x -> x mod 2 = 1) in
  List.iter (fun x -> Printf.printf "%d " x) test1;
  print_newline ()