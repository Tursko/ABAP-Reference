*&---------------------------------------------------------------------*
*& Report YTURSKO_BASIC_EXCEPTION
*&---------------------------------------------------------------------*
*& Example of rethrowing an exception to handle it within the program.
*& Rethrowing to terminate.
*&---------------------------------------------------------------------*
REPORT ytaylor_exception_handling.

CLASS lcl_example DEFINITION.
  PUBLIC SECTION.

    CLASS-METHODS divide.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_example IMPLEMENTATION.
  METHOD divide.
    DATA :
      a TYPE i,
      b TYPE i VALUE 10.
    TRY.
        a = b / 0.
      CATCH cx_sy_zerodivide.
        "WRITE: 'Cant divide by zero!'.
        RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA: lo_test TYPE REF TO lcl_example.
  CREATE OBJECT lo_test.
  TRY.
      lo_test->divide( ).
    CATCH cx_root. "Root exception
      WRITE: 'Caught the exception.'.
      STOP.
  ENDTRY.

  WRITE: 'No exception caught.'.

END-OF-SELECTION.
