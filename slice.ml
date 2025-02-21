(*Some programming languages (like Python) allow us to quickly slice a list based on two integers i and (8)
j, to return the sublist from index i (inclusive) and j (not inclusive). We want such a slicing function
in OCaml as well.
Write a function slice as follows: given a list and two indices, i and j, extract the slice of the list
containing the elements from the i

th (inclusive) to the j

th (not inclusive) positions in the original list.

# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 2 6;;
- : string list = ["c"; "d"; "e"; "f"]
Invalid index arguments should be handled gracefully. For example,
# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 3 2;;
- : string list = []
# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 3 20;
- : string list = ["d";"e";"f";"g";"h"];
You do not need to worry about handling negative indices.*)

let rec slice lst i j current_index =
  match lst with
  | [] -> []
  | x :: xs ->
      if current_index >= j then []
      else if current_index >= i then x :: slice xs i j (current_index + 1)
      else slice xs i j (current_index + 1)

let slice_wrapper lst i j =
  if i >= j then [] (* Handle invalid indices gracefully *)
  else slice lst i j 0

(* Test cases *)
let _ =
  let test1 = slice_wrapper ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 2 6 in
  List.iter print_endline test1;
  print_newline ();

  let test2 = slice_wrapper ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3 2 in
  List.iter print_endline test2;
  print_newline ();

  let test3 = slice_wrapper ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3 20 in
  List.iter print_endline test3;
  print_newline ()
