(*Similarly, write a one-line OCaml equivalent for the following Python list comprehension: (6)
cartesian_product = [(x, y) for x in [1, 2, 3] for y in [‘a’, ‘b’, ‘c’]]
Hint: See if you want to use the function List.concat_map.*)

let cartesian_product = List.concat_map (fun x -> List.map (fun y -> (x, y)) ['a'; 'b'; 'c']) [1; 2; 3];;
    


(*
○ List.map (fun y -> (x, y)) ['a'; 'b'; 'c']: Pairs x with each y.
○ List.concat_map applies this function to every x in [1; 2;3].

*)