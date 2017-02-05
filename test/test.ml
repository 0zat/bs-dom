
let test () =
  let elem = Dom_html.document##getElementById "test" in
  let elem = Js.Null.to_opt elem in
  match elem with
  | None -> ""
  | Some s ->
    match Dom_html.cast_element s with
    | `A a -> a##href
    | _ -> ""
