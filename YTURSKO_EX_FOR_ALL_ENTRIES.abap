*&---------------------------------------------------------------------*
*& Report YTURSKO_EX_FOR_ALL_ENTRIES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YTURSKO_EX_FOR_ALL_ENTRIES.

TYPES:
  BEGIN OF ls_union,
    bname TYPE xubname,
    datfm TYPE xudatfm,
    trdat TYPE xuldate,
    ltime TYPE xultime,
  END OF ls_union.

DATA: lt_usr01    TYPE STANDARD TABLE OF usr01,
      lt_usr02    TYPE STANDARD TABLE OF usr02,
      ls_combined TYPE ls_union,
      lt_combined TYPE STANDARD TABLE OF ls_union.

* Selecting data from the first table.
SELECT *
  UP TO 10 ROWS "Just want 10 rows
  FROM usr01
  INTO CORRESPONDING FIELDS OF TABLE lt_usr01.
SORT lt_usr01 BY bname.
DELETE ADJACENT DUPLICATES FROM lt_usr01.

* Getting data from second table BUT only if it occurs in the first.
* Must check if the first table is populated.
IF lt_usr01 IS NOT INITIAL.
  SELECT *
    FROM usr02
    INTO CORRESPONDING FIELDS OF TABLE lt_usr02
    FOR ALL ENTRIES IN lt_usr01
    WHERE bname = lt_usr01-bname.
  SORT lt_usr02 BY bname.
ENDIF.

FIELD-SYMBOLS: <fs_usr01> TYPE usr01,
               <fs_usr02> TYPE usr02.

* Combining the data into a single structure and then appending it to a new table.
LOOP AT lt_usr01 ASSIGNING <fs_usr01>.
  CLEAR ls_combined.
  UNASSIGN <fs_usr02>.

  READ TABLE lt_usr02 ASSIGNING <fs_usr02> WITH KEY bname = <fs_usr01>-bname.

*  You can use 'MOVE-CORRESPONDING' if your field names are the same.
*  If they aren't then you'll need to do direct assignments.
*   Example:
*    ls_combined-bname = <fs_usr01>-bname.
*    ls_combined-datfm = <fs_usr01>-datfm.
*    ls_combined-trdat = <fs_usr02>-trdat.
*    ls_combined-ltime = <fs_usr02>-ltime.

    MOVE-CORRESPONDING <fs_usr01> TO ls_combined.
    MOVE-CORRESPONDING <fs_usr02> TO ls_combined.

    APPEND ls_combined TO lt_combined.
  ENDLOOP.

  SORT lt_combined BY bname.

  WRITE: 'Done!'.
