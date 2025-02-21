(*Write a function called identical on, which takes three inputs: two functions f and g, and a list lst. 
It returns true if and only if the functions f and g have identical behavior on every element of lst.
# let f i = i * i;;
val f : int -> int = <fun>
# let g i = 3 * i;;
val g : int -> int = <fun>
# identical_on f g [3];;
- : bool = true
# identical_on f g [1; 2; 3];;
- : bool = false
  *)

let rec identical_on f g lst =
  match lst with
  | [] -> true
  | h :: t -> (f h = g h) && identical_on f g t
