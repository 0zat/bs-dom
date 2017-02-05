(*
* extract jsoo type definitions and convert them to BuckleScript.
* this script will abandon some definitions (ex. module definitions).
* you may have to compensate by your hands.
* usage : ocaml extractor.ml < jsoo file > > < your ml file >
* example : ocaml extractor.ml dom_html.ml > my_dom_html.ml
*)

#use "topfind";;
#require "str";;

module Convert_keyword = struct

  let ( !! ) str = 
    let non_ident = "\\([^A-Za-z_]\\)" in
    non_ident ^ str ^ non_ident

  let ( !? ) str = "\\1" ^ str ^ "\\2"

  let ident = "\\([A-Za-z_]+\\)"

  let replace before after str =
    Str.global_replace (Str.regexp before) after str


  let replace_readonly str = replace !!"readonly_prop" !?"" str
  let replace_writeonly str = replace !!"writeonly_prop" !?"" str
  let replace_prop str = replace !!"prop" !?"" str

  let replace_unit_meth str = replace (": " ^ ident ^" meth") ": unit -> \\1" str 
  let replace_meth str = replace !!"meth" !?"" str

  let replace_bool str = replace !!"bool t" !?"boolean" str
  let replace_str str = replace !!"js_string t" !?"string" str
  let replace_opt str = replace !!"opt" !?"null" str
  let replace_def str = replace !!"optdef" !?"undefined" str
  let replace_null_undef str = replace !!"null undefined" !?"null_undefined" str

  let replace_Unsafe str = replace "Js\\.Unsafe\\." "" str
  let replace_callback str = replace ("("^ "\\(.*\\)" ^") Js\\.callback") "(\\1 [@bs])" str
  let replace_class_end str = replace "^end" "end [@bs]" str

  let replace_all str =
    replace_readonly str
    |> replace_writeonly
    |> replace_prop
    |> replace_unit_meth
    |> replace_meth
    |> replace_bool
    |> replace_str
    |> replace_opt
    |> replace_def
    |> replace_null_undef
    |> replace_Unsafe
    |> replace_callback

end



module Explicit_class_type = struct

  let is_class_type_object str = Str.string_match (Str.regexp "^class type.*object") str 0
  let is_class_type str = Str.string_match (Str.regexp "^class type") str 0
  let is_end str = Str.string_match (Str.regexp "^end") str 0
  let is_open str = Str.string_match (Str.regexp "^open") str 0
  let is_and str = Str.string_match (Str.regexp "^and") str 0
  let is_and_object str = Str.string_match (Str.regexp "^and.*object") str 0
  let is_type str = Str.string_match (Str.regexp "^type") str 0
  let is_variant str = Str.string_match (Str.regexp "^[ ]*\\(|\\|[A-Z]\\)") str 0

  let rec read_variant in_channel ans =
    match input_line in_channel with
    | line when is_variant line -> read_variant in_channel (ans ^ line ^ "\n") 
    | line -> assort in_channel line ans 
    | exception End_of_file -> ans 

  and read_class in_channel ans =
    match input_line in_channel with
    | line when not (is_end line) -> read_class in_channel (ans ^ line ^ "\n") 
    | line -> read_string in_channel (ans ^ line ^ "\n") 
    | exception End_of_file -> ans 

  and read_string in_channel ans = 
    match input_line in_channel with
    | line -> assort in_channel line ans
    | exception End_of_file -> ans

  and assort in_channel line ans = 
    match line with
    | line when is_type line -> read_variant in_channel (ans ^ "\n" ^ line ^ "\n") 
    | line when is_open line -> read_string in_channel (ans ^ line ^ "\n") 
    | line when is_and_object line -> read_class in_channel (ans ^ "\n" ^ line ^ "\n") 
    | line when is_and line -> read_variant in_channel (ans ^ "\n" ^ line ^ "\n") 
    | line when is_class_type_object line -> read_class in_channel (ans ^ "\n" ^ line ^ "\n") 
    | line when is_class_type line -> read_class in_channel (ans ^ "\n" ^ line ^ "\n")
    | _ -> read_string in_channel ans

  let read_file file =
    let in_channel = open_in file in
    let ans = read_string in_channel "" in
    begin 
      close_in in_channel;
      ans
    end
end

let _ =
  let file = Sys.argv.(1) in
  let file_cont = Explicit_class_type.read_file file in
  Convert_keyword.replace_all file_cont
  |> print_string

