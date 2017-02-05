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

type any = < > Js.t
type 'a callback = (unit, 'a) Js.meth_callback
(* the below codes are extraced and converted from jsoo *)
open Js

class type cssStyleDeclaration = object
  method background : string 
  method backgroundAttachment : string 
  method backgroundColor : string 
  method backgroundImage : string 
  method backgroundPosition : string 
  method backgroundRepeat : string 
  method border : string 
  method borderBottom : string 
  method borderBottomColor : string 
  method borderBottomStyle : string 
  method borderBottomWidth : string 
  method borderCollapse : string 
  method borderColor : string 
  method borderLeft : string 
  method borderLeftColor : string 
  method borderLeftStyle : string 
  method borderLeftWidth : string 
  method borderRadius : string 
  method borderRight : string 
  method borderRightColor : string 
  method borderRightStyle : string 
  method borderRightWidth : string 
  method borderSpacing : string 
  method borderStyle : string 
  method borderTop : string 
  method borderTopColor : string 
  method borderTopStyle : string 
  method borderTopWidth : string 
  method borderWidth : string 
  method bottom : string 
  method captionSide : string 
  method clear : string 
  method clip : string 
  method color : string 
  method content : string 
  method counterIncrement : string 
  method counterReset : string 
  method cssFloat : string 
  method cssText : string 
  method cursor : string 
  method direction : string 
  method display : string 
  method emptyCells : string 
  method fill : string 
  method font : string 
  method fontFamily : string 
  method fontSize : string 
  method fontStyle : string 
  method fontVariant : string 
  method fontWeight : string 
  method height : string 
  method left : string 
  method letterSpacing : string 
  method lineHeight : string 
  method listStyle : string 
  method listStyleImage : string 
  method listStylePosition : string 
  method listStyleType : string 
  method margin : string 
  method marginBottom : string 
  method marginLeft : string 
  method marginRight : string 
  method marginTop : string 
  method maxHeight : string 
  method maxWidth : string 
  method minHeight : string 
  method minWidth : string 
  method opacity : string undefined 
  method outline : string 
  method outlineColor : string 
  method outlineOffset : string 
  method outlineStyle : string 
  method outlineWidth : string 
  method overflow : string 
  method overflowX : string 
  method overflowY : string 
  method padding : string 
  method paddingBottom : string 
  method paddingLeft : string 
  method paddingRight : string 
  method paddingTop : string 
  method pageBreakAfter : string 
  method pageBreakBefore : string 
  method pointerEvents : string 
  method position : string 
  method right : string 
  method stroke : string 
  method strokeWidth : string 
  method tableLayout : string 
  method textAlign : string 
  method textAnchor : string 
  method textDecoration : string 
  method textIndent : string 
  method textTransform : string 
  method top : string 
  method transform : string 
  method verticalAlign : string 
  method visibility : string 
  method whiteSpace : string 
  method width : string 
  method wordSpacing : string 
  method zIndex : string 
end [@bs]

type ('a, 'b) event_listener = ('a, 'b) Dom.event_listener

type mouse_button =
  | No_button
  | Left_button
  | Middle_button
  | Right_button

class type event = object
  inherit [element] Dom.event
end [@bs]

and mouseEvent = object
  inherit event
  method relatedTarget : element t null_undefined 
  method clientX : int 
  method clientY : int 
  method screenX : int 
  method screenY : int 
  method ctrlKey : boolean 
  method shiftKey : boolean 
  method altKey : boolean 
  method metaKey : boolean 
  method button : int 
  method which : mouse_button undefined 

  method fromElement : element t null_undefined 
  method toElement : element t null_undefined 
  method pageX : int undefined 
  method pageY : int undefined 
end [@bs]

and keyboardEvent = object
  inherit event
  method altKey : boolean 
  method shiftKey : boolean 
  method ctrlKey : boolean 
  method metaKey : boolean 
  method location : int 

  method key : string undefined 
  method code : string undefined 

  method which : int undefined 
  method charCode : int undefined 
  method keyCode : int 
  method keyIdentifier : string undefined 
end [@bs]

and mousewheelEvent = object (* All browsers but Firefox *)
  inherit mouseEvent
  method wheelDelta : int 
  method wheelDeltaX : int undefined 
  method wheelDeltaY : int undefined 
end [@bs]

and mouseScrollEvent = object (* Firefox *)
  inherit mouseEvent
  method detail : int 
  method axis : int undefined 
  method _HORIZONTAL_AXIS : int undefined 
  method _VERTICAL_AXIS : int undefined 
end [@bs]

and touchEvent = object
  inherit event
  method touches : touchList t 
  method targetTouches : touchList t 
  method changedTouches : touchList t 
  method ctrlKey : boolean 
  method shiftKey : boolean 
  method altKey : boolean 
  method metaKey : boolean 
  method relatedTarget : element t null_undefined 
end [@bs]

and touchList = object
  method length : int 
  method item : int -> touch t undefined 
end [@bs]

and touch = object
  method identifier : int 
  method target : element t undefined 
  method screenX : int 
  method screenY : int 
  method clientX : int 
  method clientY : int 
  method pageX : int 
  method pageY : int 
end [@bs]

and dragEvent = object
  inherit mouseEvent
  method dataTransfer : dataTransfer t 
end [@bs]

and dataTransfer = object
  method dropEffect : string 
  method effectAllowed : string 
  method files : File.fileList t 
  method types : Dom.stringList t 
  method addElement : element t -> unit 
  method clearData : string -> unit 
  method clearData_all : unit -> unit
  method getData : string -> string 
  method setData : string -> string -> unit 
  method setDragImage : element t -> int -> int -> unit 
end [@bs]

and eventTarget = object ('self)
  method onclick : ('self t, mouseEvent t) event_listener 
  method ondblclick : ('self t, mouseEvent t) event_listener 
  method onmousedown : ('self t, mouseEvent t) event_listener 
  method onmouseup : ('self t, mouseEvent t) event_listener 
  method onmouseover : ('self t, mouseEvent t) event_listener 
  method onmousemove : ('self t, mouseEvent t) event_listener 
  method onmouseout : ('self t, mouseEvent t) event_listener 
  method onkeypress : ('self t, keyboardEvent t) event_listener 
  method onkeydown : ('self t, keyboardEvent t) event_listener 
  method onkeyup : ('self t, keyboardEvent t) event_listener 
  method onscroll : ('self t, event t) event_listener 
  method ondragstart : ('self t, dragEvent t) event_listener 
  method ondragend : ('self t, dragEvent t) event_listener 
  method ondragenter : ('self t, dragEvent t) event_listener 
  method ondragover : ('self t, dragEvent t) event_listener 
  method ondragleave : ('self t, dragEvent t) event_listener 
  method ondrag : ('self t, dragEvent t) event_listener 
  method ondrop : ('self t, dragEvent t) event_listener 
end [@bs]

and popStateEvent = object
  inherit event
  method state : any 
end [@bs]

and storageEvent = object
  inherit event
  method key : string 
  method oldValue : string null 
  method keynewValue : string null 
  method url : string 
  method storageArea : storage t null 
end [@bs]

and storage = object
  method length : int 
  method key : int -> string null 
  method getItem : string -> string null 
  method setItem : string -> string -> unit 
  method removeItem : string -> unit 
  method clear : unit -> unit
end [@bs]

and hashChangeEvent = object
  inherit event
  method oldURL : string 
  method newURL : string 
end [@bs]

and nodeSelector = object
  method querySelector : string -> element t null 
  method querySelectorAll : string -> element Dom.nodeList t 
end [@bs]

and tokenList = object
  method length : int 
  method item : int -> string undefined 
  method contains : string -> boolean 
  method add : string -> unit 
  method remove : string -> unit 
  method toggle : string -> boolean 
  method stringifier : string 
end [@bs]

and element = object
  inherit Dom.element
  inherit nodeSelector
  method id : string 
  method title : string 
  method lang : string 
  method dir : string 
  method className : string 
  method classList : tokenList t 
  method style : cssStyleDeclaration t 

  method innerHTML : string 
  method outerHTML : string 
  method textContent : string null 

  method clientLeft : int 
  method clientTop : int 
  method clientWidth : int 
  method clientHeight : int 
  method offsetLeft : int 
  method offsetTop : int 
  method offsetParent : element t null 
  method offsetWidth : int 
  method offsetHeight : int 
  method scrollLeft : int 
  method scrollTop : int 
  method scrollWidth : int 
  method scrollHeight : int 

  method getClientRects : clientRectList t 
  method getBoundingClientRect : clientRect t 

  method scrollIntoView: boolean -> unit 

  method click : unit -> unit

  inherit eventTarget
end [@bs]

and clientRect = object
  method top : float 
  method right : float 
  method bottom : float 
  method left : float 
  method width : float undefined 
  method height : float undefined 
end [@bs]

and clientRectList = object
  method length : int 
  method item : int -> clientRect t null 
end [@bs]

type event_listener_id = Dom.event_listener_id

class type ['node] collection = object
  method length : int 
  method item : int -> 'node t null 
  method namedItem : string -> 'node t null 
end [@bs]

class type htmlElement = element

class type headElement = object
  inherit element
  method profile : string 
end [@bs]

class type linkElement = object
  inherit element
  method disabled : boolean 
  method charset : string 
  method crossorigin : string 
  method href : string 
  method hreflang : string 
  method media : string 
  method rel : string 
  method rev : string 
  method target : string 
  method _type : string 
end [@bs]

class type titleElement = object
  inherit element
  method text : string 
end [@bs]

class type metaElement = object
  inherit element
  method content : string 
  method httpEquiv : string 
  method name : string 
  method scheme : string 
end [@bs]

class type baseElement = object
  inherit element
  method href : string 
  method target : string 
end [@bs]

class type styleElement = object
  inherit element
  method disabled : boolean 
  method media : string 
  method _type : string 
end [@bs]

class type bodyElement = element

class type formElement = object
  inherit element
  method elements : element collection t 
  method length : int 
  method acceptCharset : string 
  method action : string 
  method enctype : string 
  method _method : string 
  method target : string 
  method submit : unit -> unit
  method reset : unit -> unit

  method onsubmit : ('self t, event t) event_listener 
end [@bs]

class type optGroupElement = object
  inherit element
  method disabled : boolean 
  method label : string 
end [@bs]

class type optionElement = object
  inherit optGroupElement
  method form : formElement t null 
  method defaultSelected : boolean 
  method text : string 
  method index : int 
  method selected : boolean 
  method value : string 
end [@bs]

class type selectElement = object ('self)
  inherit element
  method _type : string 
  method selectedIndex : int 
  method value : string 
  method length : int 
  method form : formElement t null 
  method options : optionElement collection t 
  method disabled : boolean 
  method multiple : boolean 
  method name : string 
  method size : int 
  method tabIndex : int 
  method add : #optGroupElement t -> #optGroupElement t null -> unit 
  method remove : int -> unit 
  method blur : unit -> unit
  method focus : unit -> unit
  method required : boolean 

  method onchange : ('self t, event t) event_listener 
  method oninput : ('self t, event t) event_listener 
end [@bs]

class type inputElement = object ('self)
  inherit element
  method defaultValue : string 
  method defaultChecked : string 
  method form : formElement t null 
  method accept : string 
  method accessKey : string 
  method align : string 
  method alt : string 
  method checked : boolean 
  method disabled : boolean 
  method maxLength : int 
  method name : string 
  method readOnly : boolean 
  method required : boolean 
  method size : int 
  method src : string 
  method tabIndex : int 
  method _type : string 
  method useMap : string 
  method value : string 
  method blur : unit -> unit
  method focus : unit -> unit
  method select : unit -> unit
  method files : File.fileList t undefined 
  method placeholder : string 
  method selectionDirection : string 
  method selectionStart : int 
  method selectionEnd : int 
  method onselect : ('self t, event t) event_listener 
  method onchange : ('self t, event t) event_listener 
  method oninput : ('self t, event t) event_listener 
  method onblur : ('self t, event t) event_listener 
  method onfocus : ('self t, event t) event_listener 
end [@bs]

class type textAreaElement = object ('self)
  inherit element
  method defaultValue : string 
  method form : formElement t null 
  method accessKey : string 
  method cols : int 
  method disabled : boolean 
  method name : string 
  method readOnly : boolean 
  method rows : int 
  method selectionDirection : string 
  method selectionEnd : int 
  method selectionStart : int 
  method tabIndex : int 
  method _type : string 
  method value : string 
  method blur : unit -> unit
  method focus : unit -> unit
  method select : unit -> unit
  method required : boolean 
  method placeholder : string 
  method onselect : ('self t, event t) event_listener 
  method onchange : ('self t, event t) event_listener 
  method oninput : ('self t, event t) event_listener 
  method onblur : ('self t, event t) event_listener 
  method onfocus : ('self t, event t) event_listener 
end [@bs]

class type buttonElement = object
  inherit element
  method form : formElement t null 
  method accessKey : string 
  method disabled : boolean 
  method name : string 
  method tabIndex : int 
  method _type : string 
  method value : string 
end [@bs]

class type labelElement = object
  inherit element
  method form : formElement t null 
  method accessKey : string 
  method htmlFor : string 
end [@bs]

class type fieldSetElement = object
  inherit element
  method form : formElement t null 
end [@bs]

class type legendElement = object
  inherit element
  method form : formElement t null 
  method accessKey : string 
end [@bs]

class type uListElement = element

class type oListElement = element

class type dListElement = element

class type liElement = element

class type divElement = element

class type paragraphElement = element

class type headingElement = element

class type quoteElement = object
  inherit element
  method cite : string 
end [@bs]

class type preElement = element

class type brElement = element

class type hrElement = element

class type modElement = object
  inherit element
  method cite : string 
  method dateTime : string 
end [@bs]

class type anchorElement = object
  inherit element
  method accessKey : string 
  method charset : string 
  method coords : string 
  method href : string 
  method hreflang : string 
  method name : string 
  method rel : string 
  method rev : string 
  method shape : string 
  method tabIndex : int 
  method target : string 
  method _type : string 
  method blur : unit -> unit
  method focus : unit -> unit
end [@bs]

class type imageElement = object ('self)
  inherit element
  method alt : string 
  method src : string 
  method useMap : string 
  method isMap : boolean 
  method width : int 
  method height : int 
  method naturalWidth : int undefined 
  method naturalHeight : int undefined 
  method complete : boolean 

  method onload : ('self t, event t) event_listener 
  method onerror : ('self t, event t) event_listener 
  method onabort : ('self t, event t) event_listener 
end [@bs]

class type objectElement = object
  inherit element
  method form : formElement t null 
  method code : string 
  method archive : string 
  method codeBase : string 
  method codeType : string 
  method data : string 
  method declare : boolean 
  method height : string 
  method name : string 
  method standby : string 
  method tabIndex : int 
  method _type : string 
  method useMap : string 
  method width : string 
  method document : Dom.element Dom.document t null 
end [@bs]

class type paramElement = object
  inherit element
  method name : string 
  method _type : string 
  method value : string 
  method valueType : string 
end [@bs]

class type areaElement = object
  inherit element
  method accessKey : string 
  method alt : string 
  method coords : string 
  method href : string 
  method noHref : boolean 
  method shape : string 
  method tabIndex : int 
  method target : string 
end [@bs]

class type mapElement = object
  inherit element
  method areas : areaElement collection t 
  method name : string 
end [@bs]

class type scriptElement = object
  inherit element
  method text : string 
  method charset : string 
  method defer : boolean 
  method src : string 
  method _type : string 
  method async : boolean 
end [@bs]

class type embedElement = object
  inherit element
  method src : string 
  method height : string 
  method width  : string 
  method _type : string 
end [@bs]

class type tableCellElement = object
  inherit element
  method cellIndex : int 
  method abbr : string 
  method align : string 
  method axis : string 
  method ch : string 
  method chOff : string 
  method colSpan : int 
  method headers : string 
  method rowSpan : int 
  method scope : string 
  method vAlign : string 
end [@bs]

class type tableRowElement = object
  inherit element
  method rowIndex : int 
  method sectionRowIndex : int 
  method cells : tableCellElement collection t 
  method align : string 
  method ch : string 
  method chOff : string 
  method vAlign : string 
  method insertCell : int -> tableCellElement t 
  method deleteCell : int -> unit 
end [@bs]

class type tableColElement = object
  inherit element
  method align : string 
  method ch : string 
  method chOff : string 
  method span : int 
  method vAlign : string 
  method width : string 
end [@bs]

class type tableSectionElement = object
  inherit element
  method align : string 
  method ch : string 
  method chOff : string 
  method vAlign : string 
  method rows : tableRowElement collection t 
  method insertRow : int -> tableRowElement t 
  method deleteRow : int -> unit 
end [@bs]

class type tableCaptionElement = element

class type tableElement = object
  inherit element
  method caption : tableCaptionElement t 
  method tHead : tableSectionElement t 
  method tFood : tableSectionElement t 
  method rows : tableRowElement collection t 
  method tBodies : tableSectionElement collection t 
  method align : string 
  method border : string 
  method cellPadding : string 
  method cellSpacing : string 
  method frame : string 
  method rules : string 
  method summary : string 
  method width : string 
  method createTHead : tableSectionElement t 
  method deleteTHead : unit -> unit
  method createTFoot : tableSectionElement t 
  method deleteTFoot : unit -> unit
  method createCaption : tableCaptionElement t 
  method deleteCaption : unit -> unit
  method insertRow : int -> tableRowElement t 
  method deleteRow : int -> unit 
end [@bs]

class type timeRanges = object
  method length : int 
  method start : int -> float 
  method end_ : int -> float 
end [@bs]

type networkState =
  | NETWORK_EMPTY
  | NETWORK_IDLE
  | NETWORK_LOADING
  | NETWORK_NO_SOURCE

type readyState =
  | HAVE_NOTHING
  | HAVE_METADATA
  | HAVE_CURRENT_DATA
  | HAVE_FUTURE_DATA
  | HAVE_ENOUGH_DATA

class type mediaElement = object
  inherit element
  method canPlayType : string -> string 
  method load : unit -> unit
  method play : unit -> unit
  method pause : unit -> unit

  method autoplay : boolean 
  method buffered : timeRanges t 
  method controls : boolean 
  method currentSrc : string 
  method currentTime : float 
  method duration : float 
  method ended : boolean 
  method loop : boolean 
  method mediagroup : string 
  method muted : boolean 
  method networkState_int : int 
  method networkState : networkState 
  method paused : boolean 
  method playbackRate : float 
  method played : timeRanges t 
  method preload : string 
  method readyState_int : int 
  method readyState : readyState 
  method seekable : timeRanges t 
  method seeking : boolean 
  method src : string 
  method volume : float 
end [@bs]

class type audioElement = object
  inherit mediaElement
end [@bs]

class type videoElement = object
  inherit mediaElement
end [@bs]

type context = string

type canvasPattern

class type canvasElement = object
  inherit element
  method width : int 
  method height : int 
  method toDataURL : string 
  method toDataURL_type : string -> string 
  method toDataURL_type_compression : string -> float -> string 
  method getContext : string -> canvasRenderingContext2D t 
end [@bs]

and canvasRenderingContext2D = object
  method canvas : canvasElement t 
  method save : unit -> unit
  method restore : unit -> unit
  method scale : float -> float -> unit 
  method rotate : float -> unit 
  method translate : float -> float -> unit 
  method transform :
    float -> float -> float -> float -> float -> float -> unit 
  method setTransform :
    float -> float -> float -> float -> float -> float -> unit 
  method globalAlpha : float 
  method globalCompositeOperation : string 
  method strokeStyle : string 
  method strokeStyle_gradient : canvasGradient t 
  method strokeStyle_pattern : canvasPattern t 
  method fillStyle : string 
  method fillStyle_gradient : canvasGradient t 
  method fillStyle_pattern : canvasPattern t 
  method createLinearGradient :
    float -> float -> float -> float -> canvasGradient t 
  method createRadialGradient :
    float -> float -> float -> float -> float -> float ->
    canvasGradient t 
  method createPattern : imageElement t -> string -> canvasPattern t 
  method createPattern_fromCanvas :
    canvasElement t -> string -> canvasPattern t 
  method createPattern_fromVideo :
    videoElement t -> string -> canvasPattern t 
  method lineWidth : float 
  method lineCap : string 
  method lineJoin : string 
  method miterLimit : float 

  method shadowOffsetX : float 
  method shadowOffsetY : float 
  method shadowBlur : float 
  method shadowColor : string 

  method clearRect : float -> float -> float -> float -> unit 
  method fillRect : float -> float -> float -> float -> unit 
  method strokeRect : float -> float -> float -> float -> unit 

  method beginPath : unit -> unit
  method closePath : unit -> unit
  method moveTo : float -> float -> unit 
  method lineTo : float -> float -> unit 
  method quadraticCurveTo : float -> float -> float -> float -> unit 
  method bezierCurveTo :
    float -> float -> float -> float -> float -> float -> unit 
  method arcTo : float -> float -> float -> float -> float -> unit 
  method rect : float -> float -> float -> float -> unit 
  method arc :
    float -> float -> float -> float -> float -> boolean -> unit 
  method fill : unit -> unit
  method stroke : unit -> unit
  method clip : unit -> unit
  method isPointInPath : float -> float -> boolean 

  method drawFocusRing : #element t -> float -> float -> boolean -> boolean 

  method font : string 
  method textAlign : string 
  method textBaseline : string 
  method fillText : string -> float -> float -> unit 
  method fillText_withWidth :
    string -> float -> float -> float -> unit 
  method strokeText : string -> float -> float -> unit 
  method strokeText_withWidth :
    string -> float -> float -> float -> unit 
  method measureText : string -> textMetrics t 

  method drawImage :
    imageElement t -> float -> float -> unit 
  method drawImage_withSize :
    imageElement t -> float -> float -> float -> float -> unit 
  method drawImage_full :
    imageElement t -> float -> float -> float -> float ->
    float -> float -> float -> float -> unit 
  method drawImage_fromCanvas :
    canvasElement t -> float -> float -> unit 
  method drawImage_fromCanvasWithSize :
    canvasElement t -> float -> float -> float -> float -> unit 
  method drawImage_fullFromCanvas :
    canvasElement t -> float -> float -> float -> float ->
    float -> float -> float -> float -> unit 
  method drawImage_fromVideoWithVideo :
    videoElement t -> float -> float -> unit 
  method drawImage_fromVideoWithSize :
    videoElement t -> float -> float -> float -> float -> unit 
  method drawImage_fullFromVideo :
    videoElement t -> float -> float -> float -> float ->
    float -> float -> float -> float -> unit 

  method createImageData : int -> int -> imageData t 
  method getImageData : float -> float -> float -> float -> imageData t 
  method putImageData : imageData t -> float -> float -> unit 
end [@bs]

and canvasGradient = object
  method addColorStop : float -> string -> unit 
end [@bs]

and textMetrics = object
  method width : float 
end [@bs]

and imageData = object
  method width : int 
  method height : int 
  method data : canvasPixelArray t 
end [@bs]

and canvasPixelArray = object
  method length : int 
end [@bs]

class type range = object
  method collapsed : boolean 
  method startOffset : int 
  method endOffset : int 
  method startContainer : Dom.node t 
  method endContainer : Dom.node t 
  method setStart : Dom.node t -> int -> unit 
  method setEnd : Dom.node t -> int -> unit 
  method setStartBefore : Dom.node t -> unit 
  method setEndBefore : Dom.node t -> unit 
  method setStartAfter : Dom.node t -> unit 
  method setEndAfter : Dom.node t -> unit 
  method selectNode : Dom.node t -> unit 
  method selectNodeContents : Dom.node t -> unit 
  method collapse : boolean -> unit 
  method cloneContents : Dom.documentFragment t 
  method extractContents : Dom.documentFragment t 
  method deleteContents : unit -> unit
  method insertNode : Dom.node t -> unit 
  method surroundContents : Dom.node t -> unit 
  method cloneRange : range t 
  method toString : string 
end [@bs]

class type selection = object
  method anchorNode : Dom.node t 
  method anchorOffset : int 
  method focusNode : Dom.node t 
  method focusOffset : int 
  method isCollapsed : boolean 
  method rangeCount : int 
  method getRangeAt : int -> range t 
  method collapse : boolean -> unit 
  method extend : Dom.node t -> int -> unit 
  method modify : string -> string -> string -> unit 
  method collapseToStart : unit -> unit
  method collapseToEnd : unit -> unit
  method selectAllChildren : Dom.node t -> unit 
  method addRange : range t -> unit 
  method removeRange : range t -> unit 
  method removeAllRanges : unit -> unit
  method deleteFromDocument : unit -> unit
  method containsNode : Dom.node t -> boolean -> boolean 
  method toString : string 
end [@bs]

class type document = object
  inherit [element] Dom.document
  inherit nodeSelector
  inherit eventTarget

  method title : string 
  method referrer : string 
  method domain : string 
  method _URL : string 
  method head : headElement t 
  method body : bodyElement t 
  method documentElement : htmlElement t 
  method images : imageElement collection t 
  method applets : element collection t 
  method links : element collection t 
  method forms : formElement collection t 
  method anchors : element collection t 
  method cookie : string 
  method designMode : string 
  method open_ : unit -> unit
  method close : unit -> unit
  method write : string -> unit 
  method execCommand : string -> boolean -> string null -> unit 
  method createRange : range t 
  method readyState : string 
  method getElementsByClassName : string -> element Dom.nodeList t 
  method activeElement : element t null 

  inherit eventTarget
end [@bs]

type interval_id

type timeout_id

type animation_frame_request_id

class type location = object
  method href : string 
  method protocol : string 
  method host : string 
  method hostname : string 
  method origin : string undefined 
  method port : string 
  method pathname : string 
  method search : string 
  method hash : string 

  method assign : string -> unit 
  method replace : string -> unit 
  method reload : unit -> unit
end [@bs]

class type history = object
  method length : int 
  method state : any 
  method go : int null -> unit 
  method back : unit -> unit
  method forward : unit -> unit
  method pushState : 'a. 'a -> string -> string null -> unit 
  method replaceState : 'a. 'a -> string -> string null -> unit 
end [@bs]

class type undoManager = object
end [@bs]

class type navigator = object
  method appCodeName : string 
  method appName : string 
  method appVersion : string 
  method cookieEnabled : boolean 
  method onLine : boolean 
  method platform : string 
  method userAgent : string 
  method language : string undefined 
  method userLanguage : string undefined 
end [@bs]

class type screen = object
  method width : int 
  method height : int 
  method availWidth : int 
  method availHeight : int 
end [@bs]

class type applicationCache = object
  method status : int 

  method update : unit -> unit
  method abort : unit -> unit
  method swapCache : unit -> unit

  method onchecking : (applicationCache t, event t) event_listener 
  method onerror : (applicationCache t, event t) event_listener 
  method onnoupdate : (applicationCache t, event t) event_listener 
  method ondownloading : (applicationCache t, event t) event_listener 
  method onprogress : (applicationCache t, event t) event_listener 
  method onupdateready : (applicationCache t, event t) event_listener 
  method oncached : (applicationCache t, event t) event_listener 
  method onobsolete : (applicationCache t, event t) event_listener 

  inherit eventTarget

end [@bs]

class type _URL = object
  method createObjectURL : #File.blob t -> string 
  method revokeObjectURL : string -> unit 
end [@bs]

class type window = object
  inherit eventTarget

  method document : document t 
  method applicationCache : applicationCache t 
  method name : string 
  method location : location t 
  method history : history t 
  method undoManager : undoManager t 
  method navigator : navigator t 
  method getSelection : selection t 
  method close : unit -> unit
  method closed : boolean 
  method stop : unit -> unit
  method focus : unit -> unit
  method blur : unit -> unit
  method scroll : int -> int -> unit 
  method scrollBy : int -> int -> unit 

  method sessionStorage : storage t undefined 
  method localStorage : storage t undefined 

  method top : window t 
  method parent : window t 
  method frameElement : element t null 

  method open_ : string -> string -> string null -> window t null 
  method alert : string -> unit 
  method confirm : string -> boolean 
  method prompt : string -> string -> string null 
  method print : unit -> unit

  method setInterval : (unit -> unit) callback -> float -> interval_id 
  method clearInterval : interval_id -> unit 

  method setTimeout : (unit -> unit) callback -> float -> timeout_id 
  method clearTimeout : timeout_id -> unit 

  method requestAnimationFrame :
    (float -> unit) callback -> animation_frame_request_id 
  method cancelAnimationFrame : animation_frame_request_id -> unit 

  method screen : screen t 
  method innerWidth : int undefined 
  method innerHeight : int undefined 
  method outerWidth : int undefined 
  method outerHeight : int undefined 

  method getComputedStyle : #element t -> cssStyleDeclaration t 
  method getComputedStyle_pseudoElt :
    #element t -> string -> cssStyleDeclaration t 

  method atob : string -> string 
  method btoa : string -> string 

  method onload : (window t, event t) event_listener 
  method onunload : (window t, event t) event_listener 
  method onbeforeunload : (window t, event t) event_listener 
  method onblur : (window t, event t) event_listener 
  method onfocus : (window t, event t) event_listener 
  method onresize : (window t, event t) event_listener 
  method onorientationchange : (window t, event t) event_listener 
  method onpopstate : (window t, popStateEvent t) event_listener 
  method onhashchange : (window t, hashChangeEvent t) event_listener 

  method ononline : (window t, event t) event_listener 
  method onoffline : (window t, event t) event_listener 

  method _URL : _URL t 
end [@bs]

class type frameSetElement = object
  inherit element
  method cols : string 
  method rows : string 
end [@bs]

class type frameElement = object
  inherit element
  method frameBorder : string 
  method longDesc : string 
  method marginHeight : string 
  method marginWidth : string 
  method name : string 
  method noResize : boolean 
  method scrolling : string 
  method src : string 
  method contentDocument : document t null 
end [@bs]

class type iFrameElement = object
  inherit element
  method frameBorder : string 
  method height : string 
  method width : string 
  method longDesc : string 
  method marginHeight : string 
  method marginWidth : string 
  method name : string 
  method scrolling : string 
  method src : string 
  method contentDocument : document t null 
  method contentWindow  : window t 
end [@bs]

type taggedElement =
  | A of anchorElement t
  | Area of areaElement t
  | Audio of audioElement t
  | Base of baseElement t
  | Blockquote of quoteElement t
  | Body of bodyElement t
  | Br of brElement t
  | Button of buttonElement t
  | Canvas of canvasElement t
  | Caption of tableCaptionElement t
  | Col of tableColElement t
  | Colgroup of tableColElement t
  | Del of modElement t
  | Div of divElement t
  | Dl of dListElement t
  | Embed of embedElement t
  | Fieldset of fieldSetElement t
  | Form of formElement t
  | Frameset of frameSetElement t
  | Frame of frameElement t
  | H1 of headingElement t
  | H2 of headingElement t
  | H3 of headingElement t
  | H4 of headingElement t
  | H5 of headingElement t
  | H6 of headingElement t
  | Head of headElement t
  | Hr of hrElement t
  | Html of htmlElement t
  | Iframe of iFrameElement t
  | Img of imageElement t
  | Input of inputElement t
  | Ins of modElement t
  | Label of labelElement t
  | Legend of legendElement t
  | Li of liElement t
  | Link of linkElement t
  | Map of mapElement t
  | Meta of metaElement t
  | Object of objectElement t
  | Ol of oListElement t
  | Optgroup of optGroupElement t
  | Option of optionElement t
  | P of paramElement t
  | Param of paramElement t
  | Pre of preElement t
  | Q of quoteElement t
  | Script of scriptElement t
  | Select of selectElement t
  | Style of styleElement t
  | Table of tableElement t
  | Tbody of tableSectionElement t
  | Td of tableCellElement t
  | Textarea of textAreaElement t
  | Tfoot of tableSectionElement t
  | Th of tableCellElement t
  | Thead of tableSectionElement t
  | Title of titleElement t
  | Tr of tableRowElement t
  | Ul of uListElement t
  | Video of videoElement t
  | Other of element t

type taggedEvent =
  | MouseEvent of mouseEvent t
  | KeyboardEvent of keyboardEvent t
  | MousewheelEvent of mousewheelEvent t
  | MouseScrollEvent of mouseScrollEvent t
  | PopStateEvent of popStateEvent t
  | OtherEvent of event t

type timeout_id_safe = timeout_id option ref

(* the above codes are extraced and converted from jsoo *)

external document : document Js.t = "" [@@bs.val]
external window : window Js.t = "" [@@bs.val]

let cast_node (node : Dom.node Js.t) =
  let open Bs_dom_util in
  let node_type = node##nodeType in
  let node = (node :> < > Js.t) in
  match node_type with
  | Dom.OTHER -> `OTHER (cast node : Dom.node Js.t)
  | Dom.ELEMENT -> `ELEMENT(cast node : element Js.t)
  | Dom.ATTRIBUTE -> `ATTRIBUTE(cast node : Dom.attr Js.t)
  | Dom.TEXT -> `TEXT(cast node : Dom.characterData Js.t)
  | Dom.CDATA_SECTION -> `CDATA_SECTION(cast node : Dom.characterData Js.t)
  | Dom.ENTITY_REFERENCE -> `ENTITY_REFERENCE(cast node : Dom.node Js.t)
  | Dom.ENTITY -> `ENTITY(cast node : Dom.node Js.t)
  | Dom.PROCESSING_INSTRUCTION -> `PROCESSING_INSTRUCTION(cast node : Dom.node Js.t)
  | Dom.COMMENT -> `COMMENT(cast node : Dom.characterData Js.t)
  | Dom.DOCUMENT -> `DOCUMENT(cast node : document Js.t)
  | Dom.DOCUMENT_TYPE -> `DOCUMENT_TYPE(cast node : Dom.node Js.t)
  | Dom.DOCUMENT_FRAGMENT -> `DOCUMENT_FRAGMENT(cast node : Dom.documentFragment Js.t)
  | Dom.NOTATION -> `NOTATION(cast node : Dom.node Js.t)

let cast_element (element : element Js.t) =
  let open Bs_dom_util in
  let tagname = element##tagName in
  let element = (element :> < > Js.t) in
  match tagname with
  | "A" -> `A(cast element : anchorElement Js.t)
  | "ABBR" -> `ABBR(cast element : element Js.t)
  | "ACRONYM" -> `ACRONYM(cast element : element Js.t)
  | "ADDRESS" -> `ADDRESS(cast element : element Js.t)
  | "APPLET" -> `APPLET(cast element : element Js.t)
  | "AREA" -> `AREA(cast element : areaElement Js.t)
  | "ARTICLE" -> `ARTICLE(cast element : element Js.t)
  | "ASIDE" -> `ASIDE(cast element : element Js.t)
  | "AUDIO" -> `AUDIO(cast element : audioElement Js.t)
  | "B" -> `B(cast element : element Js.t)
  | "BASE" -> `BASE(cast element : baseElement Js.t)
  | "BASEFONT" -> `BASEFONT(cast element : element Js.t)
  | "BDI" -> `BDI(cast element : element Js.t)
  | "BDO" -> `BDO(cast element : element Js.t)
  | "BIG" -> `BIG(cast element : element Js.t)
  | "BLOCKQUOTE" -> `BLOCKQUOTE(cast element : quoteElement Js.t)
  | "BODY" -> `BODY(cast element : bodyElement Js.t)
  | "BR" -> `BR(cast element : brElement Js.t)
  | "BUTTON" -> `BUTTON(cast element : buttonElement Js.t)
  | "CANVAS" -> `CANVAS(cast element : element Js.t)
  | "CAPTION" -> `CAPTION(cast element : tableCaptionElement Js.t)
  | "CENTER" -> `CENTER(cast element : element Js.t)
  | "CITE" -> `CITE(cast element : element Js.t)
  | "CODE" -> `CODE(cast element : element Js.t)
  | "COL" -> `COL(cast element : tableColElement Js.t)
  | "COLGROUP" -> `COLGROUP(cast element : tableColElement Js.t)
  | "DATALIST" -> `DATALIST(cast element : element Js.t)
  | "DD" -> `DD(cast element : element Js.t)
  | "DEL" -> `DEL(cast element : modElement Js.t)
  | "DETAILS" -> `DETAILS(cast element : element Js.t)
  | "DFN" -> `DFN(cast element : element Js.t)
  | "DIALOG" -> `DIALOG(cast element : element Js.t)
  | "DIR" -> `DIR(cast element : element Js.t)
  | "DIV" -> `DIV(cast element : divElement Js.t)
  | "DL" -> `DL(cast element : dListElement Js.t)
  | "DT" -> `DT(cast element : element Js.t)
  | "EM" -> `EM(cast element : element Js.t)
  | "EMBED" -> `EMBED(cast element : embedElement Js.t)
  | "FIELDSET" -> `FIELDSET(cast element : element Js.t)
  | "FIGCAPTION" -> `FIGCAPTION(cast element : element Js.t)
  | "FIGURE" -> `FIGURE(cast element : element Js.t)
  | "FONT" -> `FONT(cast element : element Js.t)
  | "FOOTER" -> `FOOTER(cast element : element Js.t)
  | "FORM" -> `FORM(cast element : formElement Js.t)
  | "FRAME" -> `FRAME(cast element : frameElement Js.t)
  | "FRAMESET" -> `FRAMESET(cast element : frameSetElement Js.t)
  | "H1" -> `H1(cast element : headingElement Js.t)
  | "H2" -> `H2(cast element : headingElement Js.t)
  | "H3" -> `H3(cast element : headingElement Js.t)
  | "H4" -> `H4(cast element : headingElement Js.t)
  | "H5" -> `H5(cast element : headingElement Js.t)
  | "H6" -> `H6(cast element : headingElement Js.t)
  | "HEAD" -> `HEAD(cast element : headElement Js.t)
  | "HEADER" -> `HEADER(cast element : element Js.t)
  | "HR" -> `HR(cast element : hrElement Js.t)
  | "HTML" -> `HTML(cast element : htmlElement Js.t)
  | "I" -> `I(cast element : element Js.t)
  | "IFRAME" -> `IFRAME(cast element : iFrameElement Js.t)
  | "IMG" -> `IMG(cast element : imageElement Js.t)
  | "INPUT" -> `INPUT(cast element : inputElement Js.t)
  | "INS" -> `INS(cast element : modElement Js.t)
  | "KBD" -> `KBD(cast element : element Js.t)
  | "KEYGEN" -> `KEYGEN(cast element : element Js.t)
  | "LABEL" -> `LABEL(cast element : labelElement Js.t)
  | "LEGEND" -> `LEGEND(cast element : legendElement Js.t)
  | "LI" -> `LI(cast element : liElement Js.t)
  | "LINK" -> `LINK(cast element : linkElement Js.t)
  | "MAIN" -> `MAIN(cast element : element Js.t)
  | "MAP" -> `MAP(cast element : mapElement Js.t)
  | "MARK" -> `MARK(cast element : element Js.t)
  | "MENU" -> `MENU(cast element : element Js.t)
  | "MENUITEM" -> `MENUITEM(cast element : element Js.t)
  | "META" -> `META(cast element : metaElement Js.t)
  | "METER" -> `METER(cast element : element Js.t)
  | "NAV" -> `NAV(cast element : element Js.t)
  | "NOFRAMES" -> `NOFRAMES(cast element : element Js.t)
  | "NOSCRIPT" -> `NOSCRIPT(cast element : element Js.t)
  | "OBJECT" -> `OBJECT(cast element : objectElement Js.t)
  | "OL" -> `OL(cast element : oListElement Js.t)
  | "OPTGROUP" -> `OPTGROUP(cast element : optGroupElement Js.t)
  | "OPTION" -> `OPTION(cast element : optionElement Js.t)
  | "OUTPUT" -> `OUTPUT(cast element : element Js.t)
  | "P" -> `P(cast element : paragraphElement Js.t)
  | "PARAM" -> `PARAM(cast element : paramElement Js.t)
  | "PICTURE" -> `PICTURE(cast element : element Js.t)
  | "PRE" -> `PRE(cast element : preElement Js.t)
  | "PROGRESS" -> `PROGRESS(cast element : element Js.t)
  | "Q" -> `Q(cast element : quoteElement Js.t)
  | "RP" -> `RP(cast element : element Js.t)
  | "RT" -> `RT(cast element : element Js.t)
  | "RUBY" -> `RUBY(cast element : element Js.t)
  | "S" -> `S(cast element : element Js.t)
  | "SAMP" -> `SAMP(cast element : element Js.t)
  | "SCRIPT" -> `SCRIPT(cast element : scriptElement Js.t)
  | "SECTION" -> `SECTION(cast element : element Js.t)
  | "SELECT" -> `SELECT(cast element : selectElement Js.t)
  | "SMALL" -> `SMALL(cast element : element Js.t)
  | "SOURCE" -> `SOURCE(cast element : element Js.t)
  | "SPAN" -> `SPAN(cast element : element Js.t)
  | "STRIKE" -> `STRIKE(cast element : element Js.t)
  | "STRONG" -> `STRONG(cast element : element Js.t)
  | "STYLE" -> `STYLE(cast element : styleElement Js.t)
  | "SUB" -> `SUB(cast element : element Js.t)
  | "SUMMARY" -> `SUMMARY(cast element : element Js.t)
  | "SUP" -> `SUP(cast element : element Js.t)
  | "TABLE" -> `TABLE(cast element : tableElement Js.t)
  | "TBODY" -> `TBODY(cast element : tableSectionElement Js.t)
  | "TD" -> `TD(cast element : tableCellElement Js.t)
  | "TEXTAREA" -> `TEXTAREA(cast element : textAreaElement Js.t)
  | "TFOOT" -> `TFOOT(cast element : tableSectionElement Js.t)
  | "TH" -> `TH(cast element : tableCellElement Js.t)
  | "THEAD" -> `THEAD(cast element : tableSectionElement Js.t)
  | "TIME" -> `TIME(cast element : element Js.t)
  | "TITLE" -> `TITLE(cast element : titleElement Js.t)
  | "TR" -> `TR(cast element : tableRowElement Js.t)
  | "TRACK" -> `TRACK(cast element : element Js.t)
  | "TT" -> `TT(cast element : element Js.t)
  | "U" -> `U(cast element : element Js.t)
  | "UL" -> `UL(cast element : uListElement Js.t)
  | "VAR" -> `VAR(cast element : element Js.t)
  | "VIDEO" -> `VIDEO(cast element : audioElement Js.t)
  | "WBR" -> `WBR(cast element : element Js.t)
  | _ -> failwith "unexpected tagname"
