(*Goldbach’s conjecture states that every positive even number greater than 2 is the sum of two prime (8)
numbers. E.g., 18 = 5 + 13, or 42 = 19 + 23. It is one of the most famous conjectures in number theory.
It is unproven, but verified for all integers up to 4 × 1018
.

Write a function goldbach_pairs : int -> (int * int) list to find all pairs of prime numbers that
sum up to a given even integer.
# goldbach_pairs 10;;
- : int * int = [(3, 7); (5, 5)]

2

Programming Abstractions (Spring 2025) Assignment I Deadline: Feb 16, 11:59 pm
The returned pairs must have a non-decreasing order, and the pairs must be in non-decreasing order of
the first number. For example, the following outputs will be considered incorrect: [(7, 3); (5, 5)],
[(5, 5); (3, 7)], or [(5, 5); (7, 3)].
*)

(* Helper function to check if a number is prime *)
  let is_prime n =
    let rec check d =
      d * d > n || (n mod d <> 0 && check (d + 1))
    in
    n > 1 && check 2
  
  (* Function to find all Goldbach pairs for a given even number *)
  let goldbach_pairs n =
    if n <= 2 || n mod 2 <> 0 then
      failwith "Input must be a positive even number greater than 2."
    else
      let rec find_pairs p acc =
        if p > n / 2 then acc (* Stop when p exceeds n/2 *)
        else if is_prime p && is_prime (n - p) then
          find_pairs (p + 1) ((p, n - p) :: acc) (* Add valid prime pair *)
        else
          find_pairs (p + 1) acc (* Continue searching *)
      in
      find_pairs 2 []
  
  (* Example Usage *)
  let test_input = 10
  let result = goldbach_pairs test_input
  
