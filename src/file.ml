(* Bs_dom library 
 *
 * This Library includes modified Js_of_ocaml library and inherits its license(GPLv2). 
 * Js_of_ocaml's license is the following.
 *
 ** Js_of_ocaml library
 ** http://www.ocsigen.org/js_of_ocaml/
 ** Copyright (C) 2011 Pierre Chambart
 ** Laboratoire PPS - CNRS Université Paris Diderot
 **
 ** This program is free software; you can redistribute it and/or modify
 ** it under the terms of the GNU Lesser General Public License as published by
 ** the Free Software Foundation, with linking exception;
 ** either version 2.1 of the License, or (at your option) any later version.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU Lesser General Public License for more details.
 **
 ** You should have received a copy of the GNU Lesser General Public License
 ** along with this program; if not, write to the Free Software
 ** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

(* the below codes are extraced and converted from jsoo *)
open Js
open Dom

class type blob = object
  method size : int 
  method _type : string 
  method slice : int -> int -> blob t 
  method slice_withContentType : int -> int -> string -> blob t 
end [@bs]

class type file = object
  inherit blob
  method name : string 
  method lastModifiedDate : string 
end [@bs]

class type file_name_only = object
  method name : string undefined 
  method fileName : string undefined 
end [@bs]

type file_any = < > t

class type fileList = object
  inherit [file] Dom.nodeList
end [@bs]

class type fileError = object
  method code : int 
end [@bs]

class type ['a] progressEvent = object
  inherit ['a] event
  method lengthComputable : boolean 
  method loaded : int 
  method total : int 
end [@bs]

class type progressEventTarget = object ('self)
  method onloadstart : ('self t, 'self progressEvent t) event_listener 
  method onprogress : ('self t, 'self progressEvent t) event_listener 
  method onload : ('self t, 'self progressEvent t) event_listener 
  method onabort : ('self t, 'self progressEvent t) event_listener 
  method onerror : ('self t, 'self progressEvent t) event_listener 
  method onloadend : ('self t, 'self progressEvent t) event_listener 
end [@bs]

type readyState = EMPTY | LOADING | DONE

class type fileReader = object ('self)

  method readAsArrayBuffer : #blob t -> unit 
  method readAsBinaryString : #blob t -> unit 
  method readAsText : #blob t -> unit 
  method readAsText_withEncoding : #blob t -> string -> unit 
  method readAsDataURL : #blob t -> unit 

  method abort : unit -> unit

  method readyState : readyState 

  method result : file_any 
  method error : fileError t 

  inherit progressEventTarget
end [@bs]
(* the above codes are extraced and converted from jsoo *)


let get_result (result : file_any) =
  if Js.typeof result = "string" then
    `String (Util.cast result : string)
  else
    `ArrayBuffer (Util.cast result : Typed_array.arrayBuffer Js.t)