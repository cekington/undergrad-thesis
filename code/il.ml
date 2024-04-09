type channel = 
  | ChanVar of string
  | ChanConst of int 

type typ = 
  | Tensor of string * string 
  | Par of string * string
  | Plus of (string * string) list
  | With of (string * string) list
  | One 
  | Dual of string

type msg = 
  | Unit
  | Label of string
  | Channel of channel

type proc = 
  | Send of channel * msg * proc option
  | Recv of channel * cont 
  | Fwd of channel * channel
  | Call of string * channel list * channel list
  | Cancel of channel * proc option
  | Trycatch of (channel * typ) option * proc * proc
  | Raise of proc 
  | Cut of channel * typ * proc * proc
  | Null

and cont = 
  | ContUnit of proc 
  | ContLabel of (string * proc) list
  | ContChannel of channel * proc

type def = 
  | TypDef of string * typ
  | ProcDef of string * (channel * typ) list * (channel * typ) list * proc
  | Exec of string 

type prog = def list