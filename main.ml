
let _ =
  let d = Z.of_string "-32317006071311007300714876688669951960444102669715484032130345427524655138867890893197201411522913463688717960921898019494119559150490921095088152386448283120630877367300996091750197750389652106796057638384067568276792218642619756161838094338476170470581645852036305042887575891541065808607552399123930385521914333389668342420684974786564569494856176035326322058077805659331026192708460314150258592864177116725943603718461857357598351152301645904403697613233287231227125684710820209725157101726931323469678542580656697935045997268352998638215525166389437335543602135433229604645318478604952148193555853611059596229099" in

  (*
  let identity = Classgroup.(identity_for_discriminant d) in
  print_endline Classgroup.(pp identity) ;
  print_endline (Classgroup.discriminant identity |> Z.to_string) ;

*)
  let c = Classgroup.from_ab_discriminant (Z.of_int 5) (Z.of_int 1) d in
  (* print_endline Classgroup.(pp c);
     print_endline Classgroup.(discriminant c |> Z.to_string ) ; *)


(*  for n = 0 to 10000000 do
    let n = Z.of_int n in
    let cn = Classgroup.(c ^ n) in
    Printf.printf "%s\t\t%s\t\t%s"
      (Z.to_string n)
      Classgroup.(pp cn)
      Classgroup.(discriminant cn |> Z.to_string) ;
    print_newline () *)

  let rc = ref c in
  for _ = 0 to 100000 do
    rc := Classgroup.square !rc ;
  done;
  Printf.printf "%s\n" (Classgroup.pp !rc) ;
