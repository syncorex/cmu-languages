print_string "Hello world!\n"



(* valid_attach_point: Checks if an attachment point would allow the dog to reach all the hatches.)

bool valid_attach(attach, l_leash, hatches) {
	for hatch in hatches
		if l_leash < sqrt(abs((hatch.x - attach.x) + (hatch.y - attach.y)))
			return false;
	return true;
}
*)

let valid_attach_point l_leash = 
	let l_leash = 

(* find_attach_pos: Finds attach spot for leash of lowest X and Y values that reaches all hatches, or returns "poodle" if none exists

for(y = l_leash; y < roof_size - l_leash; y++)
	for(x = leash_l; x < roof_size - l_leash; y++)
		if(valid_attach_point(x, y);)
			print(x ^ " " ^ y);
			break;
*)



(* Read in the amount of cases. *)
let cases = read_line()

(* For each case, read in l_leash and n_atches*)
	let data = Str.split(Str.regexp " ") read_line() in
	let leash_l = (nth data 0) in
	let n_hatches = (nth data 1) in

	(* Call read_hatches(n_hatches) *)
	let hatches = make (n_hatches * 2) 0 in
	for i = 0 to (n_hatches-1) do
		let coords = Str.split(Str.regexp " ") read_line
		hatches(i) <- read_line
	done;

	(* Call find_attach_pos *)
	find_attach_pos()

(*https://v2.ocaml.org/releases/4.14/htmlman/index.html *)
(* str.split() - https://stackoverflow.com/questions/32672704/using-the-in-keyword-in-ocaml *)
