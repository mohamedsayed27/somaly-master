part of 'ProFollowingListImports.dart';

class ProFollowingListData {
  final GenericBloc<List<FollowerModel>> followerCubit = new GenericBloc([]);
  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await GeneralRepository(context).getListFollower(refresh);
    followerCubit.onUpdateData(data);
  }

  deleteFollower(BuildContext context, String userId) async {
    bool result = await ProviderRepository(context).removeFollower(userId);
    if (result == true) {
      followerCubit.state.data.remove(userId);
      followerCubit.onUpdateData(followerCubit.state.data);
      fetchData(context);
    }
  }
}
