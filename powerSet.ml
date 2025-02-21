(*The power set of a set S is the set of all subsets of S (including the empty set and the entire set). (8)
Write a function powerset of the type 'a list -> 'a list list, which treats lists as unordered sets,
and returns the powerset of its input list. You may assume that the input list has no duplicates.
# powerset [3; 4; 10];;
- : int list list = [[]; [3]; [4]; [10]; [3; 4]; [3; 10]; [4; 10]; [3; 4; 10]]
This is essentially a set-theoretic problem. So, the order of items in the output list does not matter.*)


(* Function to apply a function to each element of a list *)
let rec map f lst =
  match lst with
  | [] -> []
  | x :: xs -> f x :: map f xs

(* Function to compute the powerset of a list *)
let rec powerset lst =
  match lst with
  | [] -> [[]] (* Base case: The powerset of an empty list is [[]] *)
  | x :: xs ->
      let ps = powerset xs in
      ps @ map (fun subset -> x :: subset) ps

(* Example Usage *)
let result = powerset [1; 2; 3]
