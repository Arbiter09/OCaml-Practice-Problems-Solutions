(*Write the polynomial function, which takes a list of tuples and returns the polynomial function corre- (8)
sponding to that list. Each tuple in the input list consists of (i) the coefficient, and (ii) the exponent.
You should assume that the tuples in the input list are given in decreasing order of the exponent.
# (* below is the polynomial function f(x) = 3x^3 - 2x + 5 *)
(* note the decreasing order of exponents: x^3, then x^1, then x^0 *)
# let f = polynomial [3, 3; -2, 1; 5, 0];;
val f : int -> int = <fun>
# f 2;;
- : int = 25*)

(* Helper function to compute exponentiation recursively *)
let rec pow x n =
  match n with
  | 0 -> 1 (* Base case: x^0 = 1 *)
  | _ -> x * pow x (n - 1) (* Recursive case: x^n = x * x^(n-1) *)

(* Function to evaluate a polynomial recursively *)
let rec polynomial lst x =
  match lst with
  | [] -> 0 (* Base case: Empty polynomial evaluates to 0 *)
  | (co, ex) :: t -> co * pow x ex + polynomial t x (* Recursive evaluation *)

(* Example Usage *)
let f = polynomial [(3, 3); (-2, 1); (5, 0)]
let result = f 2 (* Evaluates 3*(2^3) - 2*(2^1) + 5 *)
