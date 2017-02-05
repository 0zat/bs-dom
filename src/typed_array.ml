(* Bs_dom library 
 *
 * This Library includes modified Js_of_ocaml library and inherits its license(GPLv2).
 * Js_of_ocaml's license is the following.
 *
 * Js_of_ocaml library
 * http://www.ocsigen.org/js_of_ocaml/
 * Copyright (C) 2012 Jérôme Vouillon
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

type 'a t = 'a Js.t
type boolean = Js.boolean

(* the below codes are extraced and converted from jsoo *)

class type arrayBuffer = object
  method byteLength : int 
end [@bs]

class type arrayBufferView = object
  method buffer : arrayBuffer t 
  method byteOffset : int 
  method byteLength : int 
end [@bs]

class type ['a, 'b] typedArray = object
  inherit arrayBufferView
  method _BYTES_PER_ELEMENT : int 
  method length : int 
  method set_fromArray : 'a array -> int -> unit 
  method set_fromTypedArray : ('a, 'b) typedArray t -> int -> unit 
  method subarray : int -> int -> ('a, 'b) typedArray t 
  method subarray_toEnd : int -> ('a, 'b) typedArray t 
  method _content_type_ : 'b
end [@bs]

type int8Array = (int, [`Int8]) typedArray
type uint8Array = (int, [`Uint8]) typedArray
type int16Array = (int, [`Int16]) typedArray
type uint16Array = (int, [`Uint16]) typedArray
type int32Array = (int, [`Int32]) typedArray
type uint32Array = (float, [`Uint32]) typedArray
type float32Array = (float, [`Float32]) typedArray
type float64Array = (float, [`Float64]) typedArray

class type dataView = object
  inherit arrayBufferView
  method getInt8 : int -> int 
  method getUint8 : int -> int 
  method getInt16_ : int -> boolean -> int 
  method getUint16 : int -> int 
  method getUint16_ : int -> boolean -> int 
  method getInt32 : int -> int 
  method getInt32_ : int -> boolean -> int 
  method getUint32 : int -> float 
  method getUint32_ : int -> boolean -> float 
  method getFloat32 : int -> float 
  method getFloat32_ : int -> boolean -> float 
  method getFloat64 : int -> float 
  method getFloat64_ : int -> boolean -> float 
  method setInt8 : int -> int -> unit 
  method setUint8 : int -> int -> unit 
  method setInt16 : int -> int -> unit 
  method setInt16_ : int -> int -> boolean -> unit 
  method setUint16 : int -> int -> unit 
  method setUint16_ : int -> int -> boolean -> unit 
  method setInt32 : int -> int -> unit 
  method setInt32_ : int -> int -> boolean -> unit 
  method setUint32 : int -> float -> unit 
  method setUint32_ : int -> float -> boolean -> unit 
  method setFloat32 : int -> float -> unit 
  method setFloat32_ : int -> float -> boolean -> unit 
  method setFloat64 : int -> float -> unit 
  method setFloat64_ : int -> float -> boolean -> unit 
end [@bs]
(* the above codes are extraced and converted from jsoo *)

external int8Array : (int -> int8Array t) = "Int8Array" [@@bs.new]
external int8Array_fromArray : (int array -> int8Array t) = "Int8Array" [@@bs.new]
external int8Array_fromTypedArray : (int8Array t -> int8Array t) = "Int8Array" [@@bs.new]
external int8Array_fromBuffer : (arrayBuffer t -> int8Array t) = "Int8Array" [@@bs.new]
external int8Array_inBuffer : (arrayBuffer t -> int -> int -> int8Array t) = "Int8Array" [@@bs.new]

external uint8Array : (int -> uint8Array t) = "Uint8Array" [@@bs.new]
external uint8Array_fromArray : (int array -> uint8Array t) = "Uint8Array" [@@bs.new]
external uint8Array_fromTypedArray : (uint8Array t -> uint8Array t) = "Uint8Array" [@@bs.new]
external uint8Array_fromBuffer : (arrayBuffer t -> uint8Array t) = "Uint8Array" [@@bs.new]
external uint8Array_inBuffer : (arrayBuffer t -> int -> int -> uint8Array t) = "Uint8Array" [@@bs.new]

external int16Array : (int -> int16Array t) = "Int16Array" [@@bs.new]
external int16Array_fromArray : (int array -> int16Array t) = "Int16Array" [@@bs.new]
external int16Array_fromTypedArray : (int16Array t -> int16Array t) = "Int16Array" [@@bs.new]
external int16Array_fromBuffer : (arrayBuffer t -> int16Array t) = "Int16Array" [@@bs.new]
external int16Array_inBuffer : (arrayBuffer t -> int -> int -> int16Array t) = "Int16Array" [@@bs.new]

external uint16Array : (int -> uint16Array t) = "Uint16Array" [@@bs.new]
external uint16Array_fromArray : (int array -> uint16Array t) = "Uint16Array" [@@bs.new]
external uint16Array_fromTypedArray : (uint16Array t -> uint16Array t) = "Uint16Array" [@@bs.new]
external uint16Array_fromBuffer : (arrayBuffer t -> uint16Array t) = "Uint16Array" [@@bs.new]
external uint16Array_inBuffer : (arrayBuffer t -> int -> int -> uint16Array t) = "Uint16Array" [@@bs.new]

external int32Array : (int -> int32Array t) = "Int32Array" [@@bs.new]
external int32Array_fromArray : (int array -> int32Array t) = "Int32Array" [@@bs.new]
external int32Array_fromTypedArray : (int32Array t -> int32Array t) = "Int32Array" [@@bs.new]
external int32Array_fromBuffer : (arrayBuffer t -> int32Array t) = "Int32Array" [@@bs.new]
external int32Array_inBuffer : (arrayBuffer t -> int -> int -> int32Array t) = "Int32Array" [@@bs.new]

external uint32Array : (int -> uint32Array t) = "Uint32Array" [@@bs.new]
external uint32Array_fromArray : (float array -> uint32Array t) = "Uint32Array" [@@bs.new]
external uint32Array_fromTypedArray : (uint32Array t -> uint32Array t) = "Uint32Array" [@@bs.new]
external uint32Array_fromBuffer : (arrayBuffer t -> uint32Array t) = "Uint32Array" [@@bs.new]
external uint32Array_inBuffer : (arrayBuffer t -> int -> int -> uint32Array t) = "Uint32Array" [@@bs.new]

external float32Array : (int -> float32Array t) = "Float32Array" [@@bs.new]
external float32Array_fromArray : (float array -> float32Array t) = "Float32Array" [@@bs.new]
external float32Array_fromTypedArray : (float32Array t -> float32Array t) = "Float32Array" [@@bs.new]
external float32Array_fromBuffer : (arrayBuffer t -> float32Array t) = "Float32Array" [@@bs.new]
external float32Array_inBuffer : (arrayBuffer t -> int -> int -> float32Array t) = "Float32Array" [@@bs.new]

external float64Array : (int -> float64Array t) = "Float64Array" [@@bs.new]
external float64Array_fromArray : (float array -> float64Array t) = "Float64Array" [@@bs.new]
external float64Array_fromTypedArray : (float64Array t -> float64Array t) = "Float64Array" [@@bs.new]
external float64Array_fromBuffer : (arrayBuffer t -> float64Array t) = "Float64Array" [@@bs.new]
external float64Array_inBuffer : (arrayBuffer t -> int -> int -> float64Array t) = "Float64Array" [@@bs.new]


(* original functions*)
let set (typedArray : ('a, 'b) typedArray Js.t) index (value : 'a) = 
  Array.set (Bs_dom_util.cast (typedArray :> < > Js.t)) index value

let get (typedArray : ('a, 'b) typedArray Js.t) index : 'a = 
  Array.get (Bs_dom_util.cast (typedArray :> < > Js.t)) index