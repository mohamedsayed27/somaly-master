part of 'FollowingListImports.dart';

class FollowingList extends StatelessWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "${tr(context, "followingList")}", showBack: true),
      body: GenericListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: List.generate(
          7,
          (index) => BuildFollowingCard(
            imgURL: "https://reqres.in/img/faces/5-image.jpg",
            name: "${tr(context, "provName")}",
            address: "${tr(context, "KSaudiArab")}",
          ),
        ),
      ),
    );
  }
}
