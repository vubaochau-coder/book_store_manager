# Diff Details

Date : 2024-01-05 06:54:10

Directory d:\\Flutter Application\\book_store_manager\\lib

Total : 82 files,  3999 codes, 18 comments, 404 blanks, all 4421 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/constant/app_icons.dart](/lib/constant/app_icons.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/constant/app_images.dart](/lib/constant/app_images.dart) | Dart | 2 | 0 | 0 | 2 |
| [lib/constant/data_collections.dart](/lib/constant/data_collections.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/constant/enum.dart](/lib/constant/enum.dart) | Dart | 3 | 0 | 3 | 6 |
| [lib/extensions/datetime_ex.dart](/lib/extensions/datetime_ex.dart) | Dart | 49 | 0 | 7 | 56 |
| [lib/extensions/string_ex.dart](/lib/extensions/string_ex.dart) | Dart | 0 | 0 | 2 | 2 |
| [lib/main.dart](/lib/main.dart) | Dart | 8 | 0 | 0 | 8 |
| [lib/models/feedback_model.dart](/lib/models/feedback_model.dart) | Dart | 49 | 0 | 4 | 53 |
| [lib/models/notification_model.dart](/lib/models/notification_model.dart) | Dart | 37 | 0 | 4 | 41 |
| [lib/models/order_product_model.dart](/lib/models/order_product_model.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/models/user_model.dart](/lib/models/user_model.dart) | Dart | 13 | 0 | 3 | 16 |
| [lib/repositories/feedback_repository.dart](/lib/repositories/feedback_repository.dart) | Dart | 30 | 0 | 11 | 41 |
| [lib/repositories/notification_repository.dart](/lib/repositories/notification_repository.dart) | Dart | 28 | 0 | 10 | 38 |
| [lib/repositories/order_repository.dart](/lib/repositories/order_repository.dart) | Dart | 6 | 0 | 2 | 8 |
| [lib/repositories/repository.dart](/lib/repositories/repository.dart) | Dart | 6 | 0 | 0 | 6 |
| [lib/repositories/services/feedback_service.dart](/lib/repositories/services/feedback_service.dart) | Dart | 102 | 0 | 23 | 125 |
| [lib/repositories/services/notification_service.dart](/lib/repositories/services/notification_service.dart) | Dart | 77 | 0 | 11 | 88 |
| [lib/repositories/services/order_service.dart](/lib/repositories/services/order_service.dart) | Dart | 38 | 0 | 8 | 46 |
| [lib/repositories/services/user_service.dart](/lib/repositories/services/user_service.dart) | Dart | 7 | 0 | 2 | 9 |
| [lib/repositories/user_repository.dart](/lib/repositories/user_repository.dart) | Dart | 3 | 0 | 1 | 4 |
| [lib/screens/feedback_hide/bloc/feedback_hide_bloc.dart](/lib/screens/feedback_hide/bloc/feedback_hide_bloc.dart) | Dart | 32 | 0 | 9 | 41 |
| [lib/screens/feedback_hide/bloc/feedback_hide_event.dart](/lib/screens/feedback_hide/bloc/feedback_hide_event.dart) | Dart | 11 | 0 | 6 | 17 |
| [lib/screens/feedback_hide/bloc/feedback_hide_state.dart](/lib/screens/feedback_hide/bloc/feedback_hide_state.dart) | Dart | 20 | 0 | 5 | 25 |
| [lib/screens/feedback_hide/feedback_hide_page.dart](/lib/screens/feedback_hide/feedback_hide_page.dart) | Dart | 68 | 0 | 6 | 74 |
| [lib/screens/feedback_hide/views/feedback_hide_item.dart](/lib/screens/feedback_hide/views/feedback_hide_item.dart) | Dart | 158 | 1 | 4 | 163 |
| [lib/screens/home/home_page.dart](/lib/screens/home/home_page.dart) | Dart | 12 | 7 | 0 | 19 |
| [lib/screens/home/views/home_tile.dart](/lib/screens/home/views/home_tile.dart) | Dart | 2 | 0 | 0 | 2 |
| [lib/screens/home/views/statistic_item.dart](/lib/screens/home/views/statistic_item.dart) | Dart | -66 | 0 | -4 | -70 |
| [lib/screens/import_product/import_product_page.dart](/lib/screens/import_product/import_product_page.dart) | Dart | 2 | 0 | 0 | 2 |
| [lib/screens/import_product/views/import_history_item.dart](/lib/screens/import_product/views/import_history_item.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/screens/manage_feedback/bloc/feedback_bloc.dart](/lib/screens/manage_feedback/bloc/feedback_bloc.dart) | Dart | 102 | 0 | 20 | 122 |
| [lib/screens/manage_feedback/bloc/feedback_event.dart](/lib/screens/manage_feedback/bloc/feedback_event.dart) | Dart | 29 | 0 | 13 | 42 |
| [lib/screens/manage_feedback/bloc/feedback_state.dart](/lib/screens/manage_feedback/bloc/feedback_state.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/screens/manage_feedback/manage_feedback_page.dart](/lib/screens/manage_feedback/manage_feedback_page.dart) | Dart | 167 | 0 | 5 | 172 |
| [lib/screens/manage_feedback/views/feedback_item.dart](/lib/screens/manage_feedback/views/feedback_item.dart) | Dart | 244 | 0 | 5 | 249 |
| [lib/screens/manage_feedback/views/reply_bottom_sheet.dart](/lib/screens/manage_feedback/views/reply_bottom_sheet.dart) | Dart | 200 | 0 | 8 | 208 |
| [lib/screens/manage_order/manage_order_page.dart](/lib/screens/manage_order/manage_order_page.dart) | Dart | 4 | 1 | 0 | 5 |
| [lib/screens/manage_product/views/product_list.dart](/lib/screens/manage_product/views/product_list.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/screens/notification/bloc/notification_bloc.dart](/lib/screens/notification/bloc/notification_bloc.dart) | Dart | 109 | 0 | 22 | 131 |
| [lib/screens/notification/bloc/notification_event.dart](/lib/screens/notification/bloc/notification_event.dart) | Dart | 21 | 0 | 11 | 32 |
| [lib/screens/notification/bloc/notification_state.dart](/lib/screens/notification/bloc/notification_state.dart) | Dart | 28 | 0 | 5 | 33 |
| [lib/screens/notification/notification_page.dart](/lib/screens/notification/notification_page.dart) | Dart | 130 | 0 | 6 | 136 |
| [lib/screens/notification/views/empty_page.dart](/lib/screens/notification/views/empty_page.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/screens/notification/views/notification_item.dart](/lib/screens/notification/views/notification_item.dart) | Dart | 195 | 0 | 7 | 202 |
| [lib/screens/notification/views/notifications_list.dart](/lib/screens/notification/views/notifications_list.dart) | Dart | 76 | 0 | 14 | 90 |
| [lib/screens/order_details/bloc/order_details_bloc.dart](/lib/screens/order_details/bloc/order_details_bloc.dart) | Dart | 6 | 7 | 3 | 16 |
| [lib/screens/order_details/bloc/order_details_event.dart](/lib/screens/order_details/bloc/order_details_event.dart) | Dart | 0 | 1 | 0 | 1 |
| [lib/screens/order_details/bloc/order_details_state.dart](/lib/screens/order_details/bloc/order_details_state.dart) | Dart | 4 | 0 | 0 | 4 |
| [lib/screens/order_details/order_details_page.dart](/lib/screens/order_details/order_details_page.dart) | Dart | -25 | 1 | 1 | -23 |
| [lib/screens/order_details/views/overview_information.dart](/lib/screens/order_details/views/overview_information.dart) | Dart | 88 | 0 | 4 | 92 |
| [lib/screens/order_done/order_done_page.dart](/lib/screens/order_done/order_done_page.dart) | Dart | 9 | 0 | 0 | 9 |
| [lib/screens/order_status/delivering/order_delivering_page.dart](/lib/screens/order_status/delivering/order_delivering_page.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/screens/order_status/prepared/order_prepared_page.dart](/lib/screens/order_status/prepared/order_prepared_page.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/screens/order_status/preparing/order_preparing_page.dart](/lib/screens/order_status/preparing/order_preparing_page.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/screens/product_detail/product_detail_page.dart](/lib/screens/product_detail/product_detail_page.dart) | Dart | -19 | 0 | 0 | -19 |
| [lib/screens/product_feedback/bloc/product_feedback_bloc.dart](/lib/screens/product_feedback/bloc/product_feedback_bloc.dart) | Dart | 75 | 0 | 19 | 94 |
| [lib/screens/product_feedback/bloc/product_feedback_event.dart](/lib/screens/product_feedback/bloc/product_feedback_event.dart) | Dart | 18 | 0 | 9 | 27 |
| [lib/screens/product_feedback/bloc/product_feedback_state.dart](/lib/screens/product_feedback/bloc/product_feedback_state.dart) | Dart | 38 | 0 | 5 | 43 |
| [lib/screens/product_feedback/product_feedback_page.dart](/lib/screens/product_feedback/product_feedback_page.dart) | Dart | 165 | 0 | 9 | 174 |
| [lib/screens/product_feedback/views/product_feedback_item.dart](/lib/screens/product_feedback/views/product_feedback_item.dart) | Dart | 140 | 0 | 4 | 144 |
| [lib/screens/product_feedback/views/product_information.dart](/lib/screens/product_feedback/views/product_information.dart) | Dart | 37 | 0 | 4 | 41 |
| [lib/screens/product_feedback/views/product_information_loading.dart](/lib/screens/product_feedback/views/product_information_loading.dart) | Dart | 55 | 0 | 3 | 58 |
| [lib/screens/statistic/bloc/statistic_bloc.dart](/lib/screens/statistic/bloc/statistic_bloc.dart) | Dart | 28 | 0 | 9 | 37 |
| [lib/screens/statistic/bloc/statistic_event.dart](/lib/screens/statistic/bloc/statistic_event.dart) | Dart | 10 | 0 | 5 | 15 |
| [lib/screens/statistic/bloc/statistic_state.dart](/lib/screens/statistic/bloc/statistic_state.dart) | Dart | 28 | 0 | 5 | 33 |
| [lib/screens/statistic/statistic_page.dart](/lib/screens/statistic/statistic_page.dart) | Dart | 338 | 0 | 10 | 348 |
| [lib/screens/statistic/views/custom_cell.dart](/lib/screens/statistic/views/custom_cell.dart) | Dart | 28 | 0 | 4 | 32 |
| [lib/screens/statistic/views/indicator.dart](/lib/screens/statistic/views/indicator.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/screens/statistic/views/month_selector.dart](/lib/screens/statistic/views/month_selector.dart) | Dart | 72 | 0 | 5 | 77 |
| [lib/screens/statistic/views/row_data.dart](/lib/screens/statistic/views/row_data.dart) | Dart | 38 | 0 | 4 | 42 |
| [lib/screens/statistic/views/statistic_line_chart.dart](/lib/screens/statistic/views/statistic_line_chart.dart) | Dart | 211 | 0 | 21 | 232 |
| [lib/screens/statistic/views/statistic_pie_chart.dart](/lib/screens/statistic/views/statistic_pie_chart.dart) | Dart | 118 | 0 | 8 | 126 |
| [lib/screens/statistic/views/statistic_table.dart](/lib/screens/statistic/views/statistic_table.dart) | Dart | 8 | 0 | 3 | 11 |
| [lib/screens/user_details/user_details_page.dart](/lib/screens/user_details/user_details_page.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/screens/user_order_history/user_order_history_page.dart](/lib/screens/user_order_history/user_order_history_page.dart) | Dart | 11 | 0 | 0 | 11 |
| [lib/utils/date_time.dart](/lib/utils/date_time.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/utils/enum_convert.dart](/lib/utils/enum_convert.dart) | Dart | 37 | 0 | 3 | 40 |
| [lib/widgets/abstract/abstract_order_item.dart](/lib/widgets/abstract/abstract_order_item.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/widgets/custom_app_bar.dart](/lib/widgets/custom_app_bar.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/widgets/dialogs/sales_dialog.dart](/lib/widgets/dialogs/sales_dialog.dart) | Dart | 263 | 0 | 11 | 274 |
| [lib/widgets/empty_feedback_list.dart](/lib/widgets/empty_feedback_list.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/widgets/statistic_item.dart](/lib/widgets/statistic_item.dart) | Dart | 66 | 0 | 4 | 70 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details