*&---------------------------------------------------------------------*
*& Report YTURSKO_FOR_ITERATION
*&---------------------------------------------------------------------*
*& This is an example of the FOR Interation Expression.
*& An iteration expression is used to perform an iteration on a table.
*& FOR can be used with Constructor Operators like NEW, VALUE. 
*&---------------------------------------------------------------------*
REPORT ytrr_for_iteration.

TYPES:
  BEGIN OF ty_customer,
    customer TYPE char10,
    name     TYPE char30,
    city     TYPE char30,
    route    TYPE char10,
  END OF ty_customer.

" Instead of using explicit types, I'm using VALUE #() to derive the type from the operand.
DATA: lt_customers TYPE TABLE OF ty_customer.
lt_customers =
  VALUE #(
    ( customer = 'C001' name = 'Customer 1' city = 'SA' route = 'R001' )
    ( customer = 'C002' name = 'Customer 2' city = 'AUS' route = 'R002' )
    ( customer = 'C003' name = 'Customer 3' city = 'DFW' route = 'R003' )
    ( customer = 'C004' name = 'Customer 4' city = 'HOU' route = 'R004' )
    ).

" Loop through LT_CUSTOMERS and return a new table including all the cities. 
DATA: lt_cities TYPE TABLE OF char30.
lt_cities =
  VALUE #(
    FOR ls_cust IN lt_customers ( ls_cust-city )
    ).

" Loop through LT_CUSTOMERS and return a copy of the table. Map the fields.
DATA: lt_customers_from_for type table of ty_customer.
lt_customers_from_for =
  VALUE #(
    FOR ls_cust in lt_customers ( customer = ls_cust-customer
                                  name = ls_cust-name
                                  city = ls_cust-city
                                  route = ls_cust-route )
                                  ).
