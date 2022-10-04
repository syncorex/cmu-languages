(* -for loop-
let cases = read_line();;
let cases = int_of_string cases;;

for i=0 to cases-1 do

	print_endline("hello")

done;;
*)

let distance x1 y1 x2 y2 = sqrt(float_of_int(abs (y2 - y1) + abs (x2 - x1)));; (*find distance between a leash point and a hatch *)

(* let s = distance 0 0 2 1;;

Printf.printf "%f\n" s *)

let nth l i = (int_of_string (List.nth l i));;

let cases = read_line();;
let cases = int_of_string cases;;
let hatches = Array.make_matrix h 2 0;;

for i=0 to cases-1 do (* run solution for every case *)
	let line = read_line() in
	let values = Str.split (Str.regexp " ") line in
    let s = (nth values 0) in
    let h = (nth values 1) in
	begin
		for i = 0 to h-1 do (*read in each hatch*)
			let hatch_line = read_line() in
			let coords = Str.split (Str.regexp " ") hatch_line in
			for k = 0 to 1 do (*populate hatch matrix*)
				hatches.(i).(k) <- nth coords k
			done;
  			Printf.printf "hello"
		done
	end;
done;;

(*https://v2.ocaml.org/releases/4.14/htmlman/index.html *)
(* str.split() - https://stackoverflow.com/questions/32672704/using-the-in-keyword-in-ocaml *)