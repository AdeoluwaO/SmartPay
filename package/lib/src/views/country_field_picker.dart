import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/countries_cubit.dart';
import 'components/bottom_sheet_widget.dart';
import 'components/field_widget.dart';
import 'components/item_box.dart';
import 'components/search_field_widget.dart';

class CountryFieldPicker extends StatefulWidget {
  final String? searchHintText;
  final String? hintText;
  final String? label;

  final CPPSFDecoration searchDecoration;
  final CPPBSHDecoration bottomSheetDecoration;
  final CPPFDecoration decoration;
  final bool isRequired;
  final String? initialValue;

  final void Function(String value)? onSelected;
  final void Function(String? value)? onSaved;

  const CountryFieldPicker({
    super.key,
    this.searchHintText,
    this.hintText,
    this.searchDecoration = const CPPSFDecoration(),
    this.bottomSheetDecoration = const CPPBSHDecoration(),
    this.decoration = const CPPFDecoration(),
    this.label,
    this.isRequired = false,
    this.onSelected,
    this.onSaved,
    this.initialValue,
  });

  @override
  State<CountryFieldPicker> createState() => _CountryFieldPickerState();
}

class _CountryFieldPickerState extends State<CountryFieldPicker> {
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: _build,
    );
  }

  Widget _build(BuildContext context, CountriesState state) {
    final isLoading = state.isLoading;
    return FieldWidget(
      onTap: isLoading ? () {} : () => _countryOnTapHandler(context, state),
      label: widget.label ?? '',
      isLoading: isLoading,
      hintText: widget.hintText,
      initialValue: state.country.name.isEmpty
          ? (isLoading ? 'Loading...' : widget.initialValue)
          : state.country.name,
      onSaved: widget.onSaved,
      isRequired: widget.isRequired,
      decoration: widget.decoration,
      searchDecoration: widget.searchDecoration,
    );
  }

  void _countryOnTapHandler(BuildContext context, CountriesState state) {
    showModalBottomSheet(
      shape: widget.bottomSheetDecoration.shape,
      isScrollControlled: true,
      // useRootNavigator: true,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (_, setState) {
            final cppBottomSheetWidget = CPPBottomSheetWidget(
              decoration: widget.bottomSheetDecoration,
              searchFieldWidget: SearchFieldWidget(
                hintText: widget.searchHintText,
                decoration: widget.searchDecoration,
                onChanged: (value) {
                  setState(() => _searchValue = value);
                },
              ),
              items: _items(context),
            );
            final child = Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: cppBottomSheetWidget,
            );
            return BlocProvider.value(
              value: BlocProvider.of<CountriesBloc>(context),
              child: child,
            );
          },
        );
      },
    );
  }

  _items(BuildContext context) {
    // final children =
    //     context.read<CountriesBloc>().getCountries(_searchValue).map(
    //   (item) {
    //     return ItemBox(
    //       value:
    //           '${widget.decoration.showFlag ? '${item.flag}  ' : ''}${item.name}',
    //       decoration: widget.bottomSheetDecoration,
    //       onTab: () {
    //         context.read<CountriesBloc>().setCountry(country: item);
    //         widget.onSelected!(item.name);
    //         Navigator.of(context).pop();
    //       },
    //     );
    //   },
    // );
    // final countries = children.toList();
    final countries = context.read<CountriesBloc>().getCountries(_searchValue);

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return ItemBox(
          value:
              '${widget.decoration.showFlag ? '${country.flag}  ' : ''}${country.name}',
          decoration: widget.bottomSheetDecoration,
          onTab: () {
            context.read<CountriesBloc>().setCountry(country: country);
            widget.onSelected!(country.name);
            Navigator.pop(context);
          },
        );
      },
    );
    //? previous implementation
    // return ListView(physics: const BouncingScrollPhysics(), children: [
    //   ...children.toList(),
    //   ItemBox(
    //     value: '${widget.decoration.showFlag ? '🌎  ' : ''}$_searchValue',
    //     decoration: widget.bottomSheetDecoration,
    //     onTab: () {
    //       context.read<CountriesBloc>().setCountry(name: _searchValue);
    //       widget.onSelected!(_searchValue);
    //       Navigator.of(context).pop();
    //     },
    //   ),
    // ]);
  }
}
