*----------------------------------------------------------------------*
*       CLASS YCL_EX_VALIDNUMBER DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS ycl_ex_validnumber DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPE-POOLS abap .
    CLASS-METHODS is_valid
      IMPORTING
        !iv_number TYPE num8
      EXPORTING
        !ev_valid TYPE abap_bool .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.                    "YCL_EX_VALIDNUMBER DEFINITION



*----------------------------------------------------------------------*
*       CLASS YCL_EX_VALIDNUMBER IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS ycl_ex_validnumber IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method YCL_EX_VALIDNUMBER=>IS_VALID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_NUMBER                      TYPE        NUM8
* | [<---] EV_VALID                       TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD is_valid.

    ev_valid = abap_false.

    IF iv_number >= 0 AND iv_number <= 100.
      ev_valid = abap_true.
    ENDIF.

  ENDMETHOD.                    "IS_VALID
ENDCLASS.                    "YCL_EX_VALIDNUMBER IMPLEMENTATION
