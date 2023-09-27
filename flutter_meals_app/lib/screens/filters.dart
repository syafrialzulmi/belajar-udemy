import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  laktoseFree,
  vegetarianFree,
  veganFree,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilters = false;
  var _laktoseFreeFilters = false;
  var _vegetarianFreeFilters = false;
  var _veganFreeFilters = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Filter Anda'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilters,
            Filter.laktoseFree: _laktoseFreeFilters,
            Filter.vegetarianFree: _vegetarianFreeFilters,
            Filter.veganFree: _veganFreeFilters,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilters,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilters = isChecked;
                });
              },
              title: Text(
                'Bebas gula',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Hanya sertakan makanan bebas gluten',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _laktoseFreeFilters,
              onChanged: (isChecked) {
                setState(() {
                  _laktoseFreeFilters = isChecked;
                });
              },
              title: Text(
                'Bebas laksota',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Hanya sertakan makanan bebas laktosa',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilters,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilters = isChecked;
                });
              },
              title: Text(
                'Bebas Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Hanya sertakan makanan bebas vegetarian',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _veganFreeFilters,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilters = isChecked;
                });
              },
              title: Text(
                'Bebas Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Hanya sertakan makanan bebas vegan',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
