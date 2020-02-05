REPORT ytursko_ex_listbox.

DATA: lv_vrm_id     TYPE vrm_id,
      lt_vrm_values TYPE vrm_values,
      ls_vrm_value  LIKE LINE OF lt_vrm_values.

PARAMETERS:
  p_ex    TYPE zidd_sap_system AS LISTBOX VISIBLE LENGTH 10 OBLIGATORY. "Blank not allowed

INITIALIZATION.

  CLEAR ls_vrm_value.
  ls_vrm_value-key =     'Choice1'. "Actual value
  ls_vrm_value-text =    'User Displayed Text'. "Displayed when user is selecting
  APPEND ls_vrm_value TO lt_vrm_values.

  CLEAR ls_vrm_value.
  ls_vrm_value-key =     'Choice2'.
  APPEND ls_vrm_value TO lt_vrm_values.

  lv_vrm_id = 'p_ex'. "Needs to match param name

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = lv_vrm_id
      values          = lt_vrm_values
    EXCEPTIONS
      id_illegavrm_id = 1
      OTHERS          = 2.

START-OF-SELECTION.
  WRITE: p_ex.
