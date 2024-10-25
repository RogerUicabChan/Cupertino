import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'styles.dart';
import 'search_bar.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 4),
              sliver: SliverList(
                delegate: _buildSliverChildBuilderDelegate(model),
              ),
            ),
          ],
        );
      },
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(AppStateModel model) {
    final results = model.search(_terms);
    return SliverChildBuilderDelegate(
      (context, index) {
        if (index < results.length) {
          return ProductRowItem(
            index: index,
            product: results[index],
            lastItem: index == results.length - 1,
          );
        }
        return null;
      },
      childCount: results.length,
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
