*----------------------------------------------------------------------*
*       CLASS YCL_EX_VALIDNUMBER DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class YCL_EX_VALIDNUMBER definition
  public
  final
  create public .

public section.

  type-pools ABAP .
  class-methods IS_VALID
    importing
      !IV_NUMBER type NUM8
    exporting
      !EV_VALID type ABAP_BOOL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS YCL_EX_VALIDNUMBER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method YCL_EX_VALIDNUMBER=>IS_VALID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_NUMBER                      TYPE        NUM8
* | [<---] EV_VALID                       TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD is_valid.

    ev_valid = abap_false.

    IF iv_number >= 0 AND iv_number <= 100.
      ev_valid = ABAP_true.
    ENDIF.

    ENDMETHOD.                    "IS_VALID
ENDCLASS.