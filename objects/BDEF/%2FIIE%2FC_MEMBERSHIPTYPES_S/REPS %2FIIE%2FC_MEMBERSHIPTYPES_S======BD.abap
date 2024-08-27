projection implementation in class /IIE/BP_C_MEMBERSHIPTYPES_S unique;
strict;
use draft;
define behavior for /IIE/C_MembershipTypes_S alias MembershipTypesAll

{
  use action Edit;
  use action Activate;
  use action Discard;
  use action Resume;
  use action Prepare;
  use action SelectCustomizingTransptReq;

  use association _MembershipTypes { create ( augment ); with draft; }
}

define behavior for /IIE/C_MembershipTypes alias MembershipTypes

{
  field ( modify )
   Description;


  use update( augment );
  use delete;

  use association _MembershipTypesAll { with draft; }
  use association _MembershipTypesText { create; with draft; }
}

define behavior for /IIE/C_MembershipTypesText alias MembershipTypesText

{
  use update;
  use delete;

  use association _MembershipTypesAll { with draft; }
  use association _MembershipTypes { with draft; }
}