*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_invoice_items_euro.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    CLASS-METHODS get_instance
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.

    METHODS run.

  PROTECTED SECTION.

  PRIVATE SECTION.

    CLASS-DATA: mo_main TYPE REF TO lcl_main.

    METHODS: constructor.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD get_instance.

    IF mo_main IS NOT BOUND.
      mo_main = NEW lcl_main( ).
    ENDIF.

    r_result = mo_main.

  ENDMETHOD.

  METHOD constructor.
    super->constructor( ).
  ENDMETHOD.

  METHOD run.

    cl_salv_gui_table_ida=>create_for_cds_view( 'Z_INVOICE_ITEMS' )->fullscreen( )->display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_main=>get_instance( )->run( ).