(*Write a function equivs of the type ('a -> 'a -> bool) -> 'a list -> 'a list list, which par-
titions a list into equivalence classes according to a given equivalence relation. Note that the equivalence

relation is provided as the first argument to equivs.
# equivs (=) [1;2;3;4];;
- : int list list = [[1];[2];[3];[4]]
# equivs (fun x y -> (=) (x mod 2) (y mod 2)) [1; 2; 3; 4; 5; 6; 7; 8];;
- : int list list = [[1; 3; 5; 7]; [2; 4; 6; 8]]*)

(* Helper function to group elements satisfying an equivalence relation *)
let rec group_helper eq list group = 
  match list with
  | [] -> list, group (* Base case: return the remaining list and the collected group *)
  | h :: t ->
      if eq h then
        (* If the element satisfies the equivalence function, add it to the group *)
        group_helper eq t (group @ [h])
      else
        (* Otherwise, continue processing the remaining list *)
        let result_list, result_group = group_helper eq t group in
        (h :: result_list), result_group

(* Function to partition a list into equivalence classes *)
let rec equivs eq list = 
  match list with
  | [] -> [] (* Base case: an empty list returns an empty set of groups *)
  | h :: t ->
      (* Extract elements belonging to the same group using group_helper *)
      let result_list, result_group = group_helper (eq h) t [] in
      (* Add the newly created group to the result and recurse on the remaining list *)
      (h :: result_group) :: (equivs eq result_list)

(* Example Usage *)
let test_input = [1; 2; 3; 4; 5; 6; 7; 8]

let result = equivs (fun x y -> x mod 2 = y mod 2) test_input
