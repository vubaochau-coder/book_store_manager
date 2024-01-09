import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/models/user_report_model.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserReportService {
  final _ref = FirebaseFirestore.instance.collection(DataCollection.report);

  Future<List<UserReportModel>> getUserReport(int status) async {
    List<UserReportModel> res = [];
    final query = await _ref.where('status', isEqualTo: status).get();

    final futureGroup = await Future.wait(
      query.docs.map(
        (e) => getFeedbackInfor(cvToString(e.data()['feedbackId'])),
      ),
    );

    for (int i = 0; i < query.size; i++) {
      res.add(UserReportModel(
        id: query.docs[i].id,
        feedbackId: cvToString(query.docs[i].data()['feedbackId']),
        report: cvToString(query.docs[i].data()['report']),
        status: cvToInt(query.docs[i].data()['status']),
        date: cvToDate(query.docs[i].data()['date']),
        feedbackAvatar: futureGroup[i]['avatar'],
        feedbackIsHide: futureGroup[i]['isHide'],
        feedbackReview: futureGroup[i]['review'],
        feedbackUserName: futureGroup[i]['name'],
        feedbackRating: futureGroup[i]['rating'],
      ));
    }

    return res;
  }

  Future<Map<String, dynamic>> getFeedbackInfor(String feedbackId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.feedback)
        .doc(feedbackId)
        .get();
    String name = cvToString(query.data()?['user']);
    String avatar = cvToString(query.data()?['userImg']);
    String review = cvToString(query.data()?['review']);
    bool isHide = cvToBool(query.data()?['isHide']);
    int rating = cvToInt(query.data()?['rating']);

    return {
      'name': name,
      'avatar': avatar,
      'review': review,
      'isHide': isHide,
      'rating': rating,
    };
  }
}
