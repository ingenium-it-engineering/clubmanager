managed with additional save implementation in class /IIE/BP_I_MEMBERSHIPTYPES_S unique;
strict;
with draft;
define behavior for /IIE/I_MembershipTypes_S alias MembershipTypesAll
draft table /IIE/D_MSTYPE_S
with unmanaged save
lock master total etag LastChangedAtMax
authorization master( global )

{
  field ( readonly )
   SingletonID,
   TransportRequestID;

  field ( notrigger )
   SingletonID,
   HideTransport,
   LastChangedAtMax;


  update;
  internal create;
  internal delete;

  draft action ( features : instance ) Edit with additional implementation;
  draft action Activate optimized;
  draft action Discard;
  draft action Resume;
  draft determine action Prepare;
  action ( features : instance ) SelectCustomizingTransptReq parameter D_SelectCustomizingTransptReqP result [1] $self;

  association _MembershipTypes { create ( features : instance ); with draft; }
}

define behavior for /IIE/I_MembershipTypes alias MembershipTypes
persistent table /IIE/MSTYPE
draft table /IIE/D_MSTYPE
etag master LocalLastChangedAt
lock dependent by _MembershipTypesAll
authorization dependent by _MembershipTypesAll

{
  field ( mandatory : create )
   Membershiptype;

  field ( readonly )
   SingletonID,
   LastChangedAt,
   LastChangedBy,
   LocalLastChangedAt;

  field ( readonly : update )
   Membershiptype;

  field ( notrigger )
   SingletonID,
   LastChangedAt,
   LastChangedBy,
   LocalLastChangedAt;


  update( features : global );
  delete( features : global );

  mapping for /IIE/MSTYPE
  {
    Membershiptype = MEMBERSHIPTYPE;
    LastChangedAt = LAST_CHANGED_AT;
    LastChangedBy = LAST_CHANGED_BY;
    LocalLastChangedAt = LOCAL_LAST_CHANGED_AT;
  }

  association _MembershipTypesAll { with draft; }
  association _MembershipTypesText { create ( features : global ); with draft; }

  validation ValidateTransportRequest on save ##NOT_ASSIGNED_TO_DETACT { create; update; delete; }
}

define behavior for /IIE/I_MembershipTypesText alias MembershipTypesText
persistent table /IIE/MSTYPE_T
draft table /IIE/D_MSTYPE_T
etag master LocalLastChangedAt
lock dependent by _MembershipTypesAll
authorization dependent by _MembershipTypesAll

{
  field ( mandatory : create )
   Langu;

  field ( readonly )
   SingletonID,
   Membershiptype,
   LocalLastChangedAt;

  field ( readonly : update )
   Langu;

  field ( notrigger )
   SingletonID,
   LocalLastChangedAt;


  update( features : global );
  delete( features : global );

  mapping for /IIE/MSTYPE_T
  {
    Langu = LANGU;
    Membershiptype = MEMBERSHIPTYPE;
    Description = DESCRIPTION;
    LocalLastChangedAt = LOCAL_LAST_CHANGED_AT;
  }

  association _MembershipTypesAll { with draft; }
  association _MembershipTypes { with draft; }

  validation ValidateTransportRequest on save ##NOT_ASSIGNED_TO_DETACT { create; update; delete; }
}