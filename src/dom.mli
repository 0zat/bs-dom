(* Bs_dom library 
 *
 * This Library includes modified Js_of_ocaml library and inherits its license(GPLv2). 
 * Js_of_ocaml's license is the following.
 *
 * Js_of_ocaml library
 * http://www.ocsigen.org/js_of_ocaml/
 * Copyright (C) 2010 Jérôme Vouillon
 * Laboratoire PPS - CNRS Université Paris Diderot
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

type documentPosition 

(* explicited class types from jsoo*)
open Js

class type ['node] nodeList = object
  method item : int -> 'node t null 
  method length : int 
end [@bs]

type nodeType =
    OTHER (* Will not happen *)
  | ELEMENT
  | ATTRIBUTE
  | TEXT
  | CDATA_SECTION
  | ENTITY_REFERENCE
  | ENTITY
  | PROCESSING_INSTRUCTION
  | COMMENT
  | DOCUMENT
  | DOCUMENT_TYPE
  | DOCUMENT_FRAGMENT
  | NOTATION

class type node = object
  method nodeName : string 
  method nodeValue : string null 
  method nodeType : nodeType 
  method parentNode : node t null 
  method childNodes : node nodeList t 
  method firstChild : node t null 
  method lastChild : node t null 
  method previousSibling : node t null 
  method nextSibling : node t null 
  method namespaceURI : string null 

  method insertBefore : node t -> node t null -> node t 
  method replaceChild : node t -> node t -> node t 
  method removeChild : node t -> node t 
  method appendChild : node t -> node t 
  method hasChildNodes : boolean 
  method cloneNode : boolean -> node t 
  method compareDocumentPosition : node t -> documentPosition 
  method lookupNamespaceURI : string -> string null 
  method lookupPrefix : string -> string null 
end [@bs]

class type attr = object
  inherit node
  method name : string 
  method specified : boolean 
  method value : string 
  method ownerElement : element t 
end [@bs]

and ['node] namedNodeMap = object
  method getNamedItem : string -> 'node t null 
  method setNamedItem : 'node t -> 'node t null 
  method removeNamedItem : string -> 'node t null 
  method item : int -> 'node t null 
  method length : int 
end [@bs]

and element = object
  inherit node
  method tagName : string 
  method getAttribute : string -> string null 
  method setAttribute : string -> string -> unit 
  method removeAttribute : string -> unit 
  method hasAttribute : string -> boolean 

  method getAttributeNS : string -> string -> string null 
  method setAttributeNS : string -> string -> string -> unit 
  method removeAttributeNS : string -> string -> unit 
  method hasAttributeNS : string -> string -> boolean 

  method getAttributeNode : string -> attr t null 
  method setAttributeNode : attr t -> attr t null 
  method removeAttributeNode : attr t -> attr t 

  method getAttributeNodeNS : string -> string -> attr t null 
  method setAttributeNodeNS : attr t -> attr t null 

  method getElementsByTagName : string -> element nodeList t 
  method attributes : attr namedNodeMap t 
end [@bs]

class type characterData = object
  inherit node
  method data : string 
  method length : int 
  method subjs_stringData : int -> int -> string 
  method appendData : string -> unit 
  method insertData : int -> string -> unit 
  method deleteData : int -> int -> unit 
  method replaceData : int -> int -> string -> unit 
end [@bs]

class type comment = characterData

class type text = characterData

class type documentFragment = node

class type ['element] document = object
  inherit node
  method documentElement : 'element t 
  method createDocumentFragment : documentFragment t 
  method createElement : string -> 'element t 
  method createElementNS : string -> string -> 'element t 
  method createTextNode : string -> text t 
  method createAttribute : string -> attr t 
  method createComment : string -> comment t 
  method getElementById : string -> 'element t null 
  method getElementsByTagName : string -> 'element nodeList t 
  method importNode : element t -> boolean -> 'element t 
  method adoptNode : element t -> 'element t 
end [@bs]

type node_type =
  | Element of element t
  | Attr of attr t
  | Text of text t
  | Other of node t

type ('a, 'b) event_listener = ('a, 'b -> boolean) meth_callback null

class type ['a] event = object
  method _type : string 
  method target : 'a t null 
  method currentTarget : 'a t null 

  (* Legacy methods *)
  method srcElement : 'a t null 
end [@bs]

type event_listener_id = unit -> unit

class type stringList = object
  method item : int -> string null 
  method length : int 
  method contains : string -> boolean 
end [@bs]

val get_documentPosition: documentPosition -> [`DISCONNECTED | `PRECEDING | `FOLLOWING | `CONTAINS | `CONTAINED_BY | `IMPLEMENTATION_SPECIFIC] list
