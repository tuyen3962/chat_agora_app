import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/widgets/loadmore/custom_loadmore.dart';

const double LOADMORE_INDICATOR_SIZE = 24;
const double HEIGHT_LOADMORE_WIDGET = 80;

class LoadMoreDelegateCustom extends LoadMoreDelegate {
  const LoadMoreDelegateCustom();

  double widgetHeight(LoadMoreStatus status) => status == LoadMoreStatus.loading ? HEIGHT_LOADMORE_WIDGET : 0;

  @override
  Widget buildChild(LoadMoreStatus status, {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.chinese}) {
    if (status == LoadMoreStatus.loading) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: widthScale(30),
                height: widthScale(30),
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 30,
                  duration: Duration(milliseconds: 800),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
