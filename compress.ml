(* Write a function compress to remove consecutive duplicates from a list. (8)
# compress ["a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e"];;
- : string list = ["a"; "b"; "c"; "a"; "d"; "e"] *)

let rec compress lst =
    match lst with
    | [] -> []
    | [x] -> [x]
    | x :: y :: rest -> if x = y then compress (y :: rest) else x :: compress (y :: rest)


(* Test cases *)
let _ =
  let test1 = compress ["a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"] in
  List.iter print_endline test1