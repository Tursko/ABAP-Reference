* Example test class, this is local to the original class.
CLASS ltc_validnumber DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
  PRIVATE SECTION.

    METHODS:  valid FOR TESTING,
              invalid FOR TESTING.
ENDCLASS.       "ltc_Validnumber


*----------------------------------------------------------------------*
*       CLASS ltc_validnumber IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS ltc_validnumber IMPLEMENTATION.

  METHOD valid .
    DATA rv_valid TYPE abap_bool.

    rv_valid = ycl_ex_validnumber=>is_valid( 1 ).

    cl_abap_unit_assert=>assert_equals(
      act   = rv_valid
      exp   = 'X'         "<--- please adapt expected value
    " msg   = 'Testing value ev_Valid'
    ).
  ENDMETHOD.       "is_Valid

  METHOD invalid.
    DATA rv_valid TYPE abap_bool.

    rv_valid = ycl_ex_validnumber=>is_valid( 101 ).

    cl_abap_unit_assert=>assert_equals(
      act   = rv_valid
      exp   = ''        "<--- please adapt expected value
    " msg   = 'Testing value ev_Valid'
    ).
  ENDMETHOD.       "invalid


ENDCLASS.       "ltc_Validnumber