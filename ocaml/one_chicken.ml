let nth l i = (int_of_string (List.nth l i));;

let line = read_line();;
let values = Str.split (Str.regexp " ") line;;
let x =	(nth values 0);;
let y = (nth values 1);;
let d = y - x;;


let decision x =
  if x == 1 then "Dr. Chaz will have 1 piece of chicken left over!"
  else if x > 1 then Printf.sprintf "Dr. Chaz will have %L pieces of chicken left over!" x
  else if x == -1 then "Dr. Chaz needs 1 more piece of chicken!"
  else Printf.sprintf "Dr. Chaz needs %d more pieces of chicken!" (-x)

let () = Printf.printf "%s\n" (decision d)

(* https://ocaml.org/docs/if-statements-and-loops *)
(* https://v2.ocaml.org/api/Printf.html *)