class-pool .
*"* class pool for class /IIE/BP_I_MEMBERSHIPTYPES_S

*"* local type definitions
include /IIE/BP_I_MEMBERSHIPTYPES_S===ccdef.

*"* class /IIE/BP_I_MEMBERSHIPTYPES_S definition
*"* public declarations
  include /IIE/BP_I_MEMBERSHIPTYPES_S===cu.
*"* protected declarations
  include /IIE/BP_I_MEMBERSHIPTYPES_S===co.
*"* private declarations
  include /IIE/BP_I_MEMBERSHIPTYPES_S===ci.
endclass. "/IIE/BP_I_MEMBERSHIPTYPES_S definition

*"* macro definitions
include /IIE/BP_I_MEMBERSHIPTYPES_S===ccmac.
*"* local class implementation
include /IIE/BP_I_MEMBERSHIPTYPES_S===ccimp.

*"* test class
include /IIE/BP_I_MEMBERSHIPTYPES_S===ccau.

class /IIE/BP_I_MEMBERSHIPTYPES_S implementation.
*"* method's implementations
  include methods.
endclass. "/IIE/BP_I_MEMBERSHIPTYPES_S implementation
