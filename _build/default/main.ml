

(* buuh *)
let buuh str =
  String.concat " " (String.split_on_char ' ' str)

(* codificar a senha, padrão 78 *)
let caesar_cipher_encrypt password =
  let shift = 78 mod 256 in
  let encode_char c =
    Char.chr ((Char.code c + shift) mod 256)
  in
  String.map encode_char password

(* decodificar *)
let caesar_cipher_decrypt password =
  let shift = 78 mod 256 in
  let decode_char c =
    Char.chr ((Char.code c - shift + 256) mod 256)
  in
  String.map decode_char password

(* adicionar nome, senha no arquivo *)
let add_data_to_file filename name password =
  let sanitized_name = buuh name in
  let sanitized_password = buuh password in
  let encrypted_password = caesar_cipher_encrypt sanitized_password in
  let entry = sanitized_name ^ ":" ^ encrypted_password in
  let oc = open_out_gen [Open_append] 0o666 filename in
  output_string oc (entry ^ "\n");
  close_out oc

(* exibir senha *)
let view_password_from_file filename name =
  let sanitized_name = buuh name in
  let rec read_lines ic =
    try
      let line = input_line ic in
      match String.split_on_char ':' line with
      | [entry_name; encrypted_password] ->
        if entry_name = sanitized_name then (
          let password = caesar_cipher_decrypt encrypted_password in
          Printf.printf "Password for Name '%s': %s\n" name password;
          close_in ic
        ) else
          read_lines ic
      | _ -> read_lines ic
    with
    | End_of_file -> close_in ic
  in
  let ic = open_in filename in
  read_lines ic

(* Aparato para processar os argumentos *)
let main () =
  match Array.length Sys.argv with
  | 4 when Sys.argv.(1) = "vie" ->
    let name = Sys.argv.(2) in
    let password = Sys.argv.(3) in
    if password = "0" then
      view_password_from_file "data" name
    else
      Printf.printf "Invalid password.\n"
  | 4 when Sys.argv.(1) = "new" ->
    let name = Sys.argv.(2) in
    let password = Sys.argv.(3) in
    add_data_to_file "data" name password
  | _ -> Printf.printf "Invalid command. Usage: %s new <name> <password>\n       %s vie <name> 0\n" Sys.argv.(0) Sys.argv.(0)

let () = main ()
