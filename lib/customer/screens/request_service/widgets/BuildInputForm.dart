part of 'RequestServiceWidgetsImports.dart';

class BuildInputForm extends StatelessWidget {
  final RequestServicesData requestServicesData;

  const BuildInputForm({required this.requestServicesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
        key: requestServicesData.formKey,
        child: Column(
          children: [
            BlocConsumer<GenericBloc<String>, GenericState<String>>(
              bloc: requestServicesData.dateCubit,
              listener: (context, state) {
                requestServicesData.date.text = state.data;
              },
              builder: (context, state) {
                return GenericTextField(
                  fieldTypes: FieldTypes.clickable,
                  controller: requestServicesData.date,
                  onTab: () => requestServicesData.onSelectDate(context),
                  type: TextInputType.datetime,
                  action: TextInputAction.next,
                  hint: "${tr(context, "date")}",
                  margin: EdgeInsets.symmetric(vertical: 8),
                  suffixIcon: Icon(Icons.calendar_today_outlined, size: 25),
                  validate: (value) => value!.validateEmpty(context),
                );
              },
            ),
            BlocConsumer<GenericBloc<String>, GenericState<String>>(
              bloc: requestServicesData.timeCubit,
              listener: (context, state) {
                requestServicesData.time.text = state.data;
              },
              builder: (context, state) {
                return GenericTextField(
                  fieldTypes: FieldTypes.clickable,
                  controller: requestServicesData.time,
                  onTab: () => requestServicesData.onSelectTime(context),
                  type: TextInputType.datetime,
                  action: TextInputAction.next,
                  hint: "${tr(context, "time")}",
                  margin: EdgeInsets.symmetric(vertical: 8),
                  suffixIcon: Icon(MyFlutterApp.time, size: 25),
                  validate: (value) => value!.validateEmpty(context),
                );
              },
            ),
            DropdownTextField<CityModel>(
              label: '${tr(context, "city")}',
              dropKey: requestServicesData.cityKey,
              margin: EdgeInsets.symmetric(vertical: 10),
              onChange: requestServicesData.setCity,
              searchHint: tr(context, 'search'),
              data: (filter) async =>
                  await CustomerRepository(context).getCities(),
              validate: (value) => value?.validateDropDown(context),
              useName: true, title: '', itemAsString: (CityModel item) {
                return "";
            },
            ),
            BuildFileInput(
              data: requestServicesData,
            ),
            GenericTextField(
              fieldTypes: FieldTypes.rich,
              type: TextInputType.text,
              controller: requestServicesData.otherOrder,
              action: TextInputAction.next,
              max: 3,
              hint: "${tr(context, "otherOrder")}",
              margin: EdgeInsets.symmetric(vertical: 8),
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
