(*Write a function suffixes, which applied to a list returns a list of all the suffixes of the input list. The (8)
type of this function must be 'a list -> 'a list list. For example:
# suffixes [1; 2; 5];;
- : int list list = [[1; 2; 5]; [2; 5]; [5]; []]
# suffixes [];;
- : [[]]*)

(* Function to generate all suffixes of a list *)
let rec suffixes lst =
  match lst with
  | [] -> [[]] (* Base case: The empty list has only itself as a suffix *)
  | _ :: xs as l -> l :: suffixes xs (* Generate suffix by removing the first element *)

(* Example Usage *)
let result = suffixes [1; 2; 5]
