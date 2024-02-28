# Diff Details

Date : 2023-12-25 15:04:50

Directory d:\\Flutter Application\\book_store_manager\\lib

Total : 87 files,  4517 codes, -1 comments, 481 blanks, all 4997 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/constant/data_collections.dart](/lib/constant/data_collections.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/constant/enum.dart](/lib/constant/enum.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/extensions/datetime_ex.dart](/lib/extensions/datetime_ex.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/models/book_type_model.dart](/lib/models/book_type_model.dart) | Dart | 35 | 0 | 5 | 40 |
| [lib/models/import_product_model.dart](/lib/models/import_product_model.dart) | Dart | 11 | 0 | 3 | 14 |
| [lib/models/product_create_model.dart](/lib/models/product_create_model.dart) | Dart | 32 | 0 | 3 | 35 |
| [lib/models/product_model.dart](/lib/models/product_model.dart) | Dart | 20 | 0 | 3 | 23 |
| [lib/repositories/import_repository.dart](/lib/repositories/import_repository.dart) | Dart | 21 | 0 | 7 | 28 |
| [lib/repositories/order_repository.dart](/lib/repositories/order_repository.dart) | Dart | 3 | 0 | 1 | 4 |
| [lib/repositories/product_repository.dart](/lib/repositories/product_repository.dart) | Dart | 34 | 0 | 6 | 40 |
| [lib/repositories/repository.dart](/lib/repositories/repository.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/repositories/services/import_service.dart](/lib/repositories/services/import_service.dart) | Dart | 64 | 0 | 12 | 76 |
| [lib/repositories/services/order_service.dart](/lib/repositories/services/order_service.dart) | Dart | 27 | 0 | 5 | 32 |
| [lib/repositories/services/product_service.dart](/lib/repositories/services/product_service.dart) | Dart | 79 | 0 | 17 | 96 |
| [lib/screens/done_order/bloc/done_order_bloc.dart](/lib/screens/done_order/bloc/done_order_bloc.dart) | Dart | -10 | -1 | -3 | -14 |
| [lib/screens/done_order/bloc/done_order_event.dart](/lib/screens/done_order/bloc/done_order_event.dart) | Dart | -6 | 0 | -3 | -9 |
| [lib/screens/done_order/bloc/done_order_state.dart](/lib/screens/done_order/bloc/done_order_state.dart) | Dart | -7 | 0 | -4 | -11 |
| [lib/screens/done_order/done_order_page.dart](/lib/screens/done_order/done_order_page.dart) | Dart | -143 | -5 | -5 | -153 |
| [lib/screens/done_order/views/filter_button.dart](/lib/screens/done_order/views/filter_button.dart) | Dart | -94 | -2 | -4 | -100 |
| [lib/screens/done_order/views/indicator.dart](/lib/screens/done_order/views/indicator.dart) | Dart | -41 | 0 | -4 | -45 |
| [lib/screens/home/home_page.dart](/lib/screens/home/home_page.dart) | Dart | 8 | 0 | 0 | 8 |
| [lib/screens/import_product/bloc/import_product_bloc.dart](/lib/screens/import_product/bloc/import_product_bloc.dart) | Dart | 56 | 0 | 13 | 69 |
| [lib/screens/import_product/bloc/import_product_event.dart](/lib/screens/import_product/bloc/import_product_event.dart) | Dart | 14 | 0 | 7 | 21 |
| [lib/screens/import_product/bloc/import_product_state.dart](/lib/screens/import_product/bloc/import_product_state.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/screens/import_product/import_product_page.dart](/lib/screens/import_product/import_product_page.dart) | Dart | 115 | 0 | 6 | 121 |
| [lib/screens/import_product/views/calendar_button.dart](/lib/screens/import_product/views/calendar_button.dart) | Dart | 72 | 0 | 4 | 76 |
| [lib/screens/import_product/views/import_history_item.dart](/lib/screens/import_product/views/import_history_item.dart) | Dart | 130 | 0 | 6 | 136 |
| [lib/screens/import_product_create/bloc/create_import_product_bloc.dart](/lib/screens/import_product_create/bloc/create_import_product_bloc.dart) | Dart | 25 | 0 | 8 | 33 |
| [lib/screens/import_product_create/bloc/create_import_product_event.dart](/lib/screens/import_product_create/bloc/create_import_product_event.dart) | Dart | 19 | 0 | 8 | 27 |
| [lib/screens/import_product_create/bloc/create_import_product_state.dart](/lib/screens/import_product_create/bloc/create_import_product_state.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/screens/import_product_create/create_import_product_page.dart](/lib/screens/import_product_create/create_import_product_page.dart) | Dart | 111 | 0 | 5 | 116 |
| [lib/screens/import_product_create/views/create_import_item.dart](/lib/screens/import_product_create/views/create_import_item.dart) | Dart | 85 | 0 | 5 | 90 |
| [lib/screens/import_product_create/views/product_picker_dialog.dart](/lib/screens/import_product_create/views/product_picker_dialog.dart) | Dart | 78 | 0 | 5 | 83 |
| [lib/screens/manage_product/bloc/manage_product_bloc.dart](/lib/screens/manage_product/bloc/manage_product_bloc.dart) | Dart | 63 | 0 | 13 | 76 |
| [lib/screens/manage_product/bloc/manage_product_event.dart](/lib/screens/manage_product/bloc/manage_product_event.dart) | Dart | 8 | 0 | 2 | 10 |
| [lib/screens/manage_product/bloc/manage_product_state.dart](/lib/screens/manage_product/bloc/manage_product_state.dart) | Dart | 21 | 0 | 0 | 21 |
| [lib/screens/manage_product/manage_product_page.dart](/lib/screens/manage_product/manage_product_page.dart) | Dart | 64 | 0 | 5 | 69 |
| [lib/screens/manage_product/views/filter_product_dialog.dart](/lib/screens/manage_product/views/filter_product_dialog.dart) | Dart | 317 | 0 | 8 | 325 |
| [lib/screens/manage_product/views/product_item.dart](/lib/screens/manage_product/views/product_item.dart) | Dart | 28 | 0 | 1 | 29 |
| [lib/screens/order_done/bloc/order_done_bloc.dart](/lib/screens/order_done/bloc/order_done_bloc.dart) | Dart | 122 | 0 | 25 | 147 |
| [lib/screens/order_done/bloc/order_done_event.dart](/lib/screens/order_done/bloc/order_done_event.dart) | Dart | 19 | 0 | 10 | 29 |
| [lib/screens/order_done/bloc/order_done_state.dart](/lib/screens/order_done/bloc/order_done_state.dart) | Dart | 45 | 0 | 5 | 50 |
| [lib/screens/order_done/order_done_page.dart](/lib/screens/order_done/order_done_page.dart) | Dart | 215 | 0 | 6 | 221 |
| [lib/screens/order_done/views/calendar_button.dart](/lib/screens/order_done/views/calendar_button.dart) | Dart | 79 | 0 | 5 | 84 |
| [lib/screens/order_done/views/filter_button.dart](/lib/screens/order_done/views/filter_button.dart) | Dart | 107 | 1 | 5 | 113 |
| [lib/screens/order_done/views/indicator.dart](/lib/screens/order_done/views/indicator.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/screens/order_done/views/order_creator.dart](/lib/screens/order_done/views/order_creator.dart) | Dart | 12 | 0 | 3 | 15 |
| [lib/screens/order_done/views/order_list.dart](/lib/screens/order_done/views/order_list.dart) | Dart | 41 | 0 | 7 | 48 |
| [lib/screens/order_done/views/search_order_field.dart](/lib/screens/order_done/views/search_order_field.dart) | Dart | 76 | 0 | 8 | 84 |
| [lib/screens/product_create/bloc/create_product_bloc.dart](/lib/screens/product_create/bloc/create_product_bloc.dart) | Dart | 124 | 0 | 30 | 154 |
| [lib/screens/product_create/bloc/create_product_event.dart](/lib/screens/product_create/bloc/create_product_event.dart) | Dart | 47 | 0 | 24 | 71 |
| [lib/screens/product_create/bloc/create_product_state.dart](/lib/screens/product_create/bloc/create_product_state.dart) | Dart | 94 | 0 | 6 | 100 |
| [lib/screens/product_create/create_product_page.dart](/lib/screens/product_create/create_product_page.dart) | Dart | 322 | 0 | 7 | 329 |
| [lib/screens/product_create/views/booktype_selector.dart](/lib/screens/product_create/views/booktype_selector.dart) | Dart | 81 | 0 | 4 | 85 |
| [lib/screens/product_create/views/custom_textfield.dart](/lib/screens/product_create/views/custom_textfield.dart) | Dart | 76 | 0 | 6 | 82 |
| [lib/screens/product_create/views/images_grid.dart](/lib/screens/product_create/views/images_grid.dart) | Dart | 119 | 0 | 9 | 128 |
| [lib/screens/product_create/views/publishing_year_selector.dart](/lib/screens/product_create/views/publishing_year_selector.dart) | Dart | 78 | 0 | 4 | 82 |
| [lib/screens/product_create/views/textfield_title.dart](/lib/screens/product_create/views/textfield_title.dart) | Dart | 26 | 0 | 4 | 30 |
| [lib/screens/product_detail/bloc/product_detail_bloc.dart](/lib/screens/product_detail/bloc/product_detail_bloc.dart) | Dart | 39 | 0 | 10 | 49 |
| [lib/screens/product_detail/bloc/product_detail_event.dart](/lib/screens/product_detail/bloc/product_detail_event.dart) | Dart | 22 | 0 | 7 | 29 |
| [lib/screens/product_detail/bloc/product_detail_state.dart](/lib/screens/product_detail/bloc/product_detail_state.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/screens/product_detail/photo_gallery_view.dart](/lib/screens/product_detail/photo_gallery_view.dart) | Dart | 73 | 0 | 8 | 81 |
| [lib/screens/product_detail/product_detail_page.dart](/lib/screens/product_detail/product_detail_page.dart) | Dart | -83 | 0 | 3 | -80 |
| [lib/screens/product_detail/views/image_product.dart](/lib/screens/product_detail/views/image_product.dart) | Dart | 76 | 0 | 6 | 82 |
| [lib/screens/product_detail/views/orther_information_product.dart](/lib/screens/product_detail/views/orther_information_product.dart) | Dart | 134 | 0 | 7 | 141 |
| [lib/screens/product_detail/views/overview_product.dart](/lib/screens/product_detail/views/overview_product.dart) | Dart | 162 | 0 | 2 | 164 |
| [lib/screens/product_detail/views/row_data.dart](/lib/screens/product_detail/views/row_data.dart) | Dart | 18 | 0 | 1 | 19 |
| [lib/screens/product_detail/views/update_orther_infor_dialog.dart](/lib/screens/product_detail/views/update_orther_infor_dialog.dart) | Dart | 239 | 0 | 12 | 251 |
| [lib/screens/product_edit_overview/bloc/product_edit_overview_bloc.dart](/lib/screens/product_edit_overview/bloc/product_edit_overview_bloc.dart) | Dart | 100 | 0 | 20 | 120 |
| [lib/screens/product_edit_overview/bloc/product_edit_overview_event.dart](/lib/screens/product_edit_overview/bloc/product_edit_overview_event.dart) | Dart | 35 | 0 | 18 | 53 |
| [lib/screens/product_edit_overview/bloc/product_edit_overview_state.dart](/lib/screens/product_edit_overview/bloc/product_edit_overview_state.dart) | Dart | 74 | 0 | 7 | 81 |
| [lib/screens/product_edit_overview/edit_overview_product_page.dart](/lib/screens/product_edit_overview/edit_overview_product_page.dart) | Dart | 304 | 0 | 16 | 320 |
| [lib/screens/product_edit_overview/views/booktype_selector.dart](/lib/screens/product_edit_overview/views/booktype_selector.dart) | Dart | 79 | 0 | 3 | 82 |
| [lib/screens/product_edit_overview/views/confirm_update_button.dart](/lib/screens/product_edit_overview/views/confirm_update_button.dart) | Dart | 95 | 0 | 7 | 102 |
| [lib/screens/product_edit_overview/views/year_selector_textfield.dart](/lib/screens/product_edit_overview/views/year_selector_textfield.dart) | Dart | 77 | 0 | 9 | 86 |
| [lib/screens/user_order_history/views/order_cancelled_item.dart](/lib/screens/user_order_history/views/order_cancelled_item.dart) | Dart | -162 | -6 | -6 | -174 |
| [lib/screens/user_order_history/views/order_completed_item.dart](/lib/screens/user_order_history/views/order_completed_item.dart) | Dart | -162 | -6 | -6 | -174 |
| [lib/themes/colors.dart](/lib/themes/colors.dart) | Dart | 2 | 0 | 1 | 3 |
| [lib/themes/texts.dart](/lib/themes/texts.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/utils/date_time.dart](/lib/utils/date_time.dart) | Dart | 16 | 0 | 4 | 20 |
| [lib/widgets/abstract/abstract_order_item.dart](/lib/widgets/abstract/abstract_order_item.dart) | Dart | 23 | 0 | 0 | 23 |
| [lib/widgets/dialogs/dialog_loading.dart](/lib/widgets/dialogs/dialog_loading.dart) | Dart | -28 | 0 | -3 | -31 |
| [lib/widgets/dialogs/loading_dialog.dart](/lib/widgets/dialogs/loading_dialog.dart) | Dart | 28 | 0 | 3 | 31 |
| [lib/widgets/dialogs/pick_image_option_dialog.dart](/lib/widgets/dialogs/pick_image_option_dialog.dart) | Dart | 67 | 18 | 4 | 89 |
| [lib/widgets/empty_import_list.dart](/lib/widgets/empty_import_list.dart) | Dart | 34 | 0 | 3 | 37 |
| [lib/widgets/month_picker.dart](/lib/widgets/month_picker.dart) | Dart | 99 | 0 | 9 | 108 |
| [lib/widgets/year_picker.dart](/lib/widgets/year_picker.dart) | Dart | 103 | 0 | 10 | 113 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details