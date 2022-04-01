DATA:   lo_wd_api_controller    TYPE REF TO if_wd_controller,
        lo_message_manager      TYPE REF TO if_wd_message_manager.

lo_wd_api_controller ?= wd_this->wd_get_api( ).
lo_message_manager = lo_wd_api_controller->get_message_manager( ). 

" After catching an exception, use below to display it on the screen
lo_message_manager->report_exception( exporting message_object = lx_caught ).
RETURN.
