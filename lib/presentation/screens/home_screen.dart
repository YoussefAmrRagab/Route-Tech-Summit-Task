import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_flutter_task/config/app_strings.dart';
import 'package:route_flutter_task/config/app_styles.dart';
import 'package:route_flutter_task/data/models/product.dart';
import 'package:route_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:route_flutter_task/presentation/view_models/home_cubit.dart';
import 'package:route_flutter_task/config/app_colors.dart';
import 'package:route_flutter_task/presentation/widgets/product_widget.dart';
import 'package:route_flutter_task/utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getProducts();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRouteLogo(),
              18.0.margin,
              buildSearchBar(context, cubit),
              12.0.margin,
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is ProductLoaded) {
                      return state.products.isNotEmpty
                          ? buildGridViewBuilder(state.products)
                          : buildNoProduct();
                    } else if (state is ProductsFiltered) {
                      return state.filteredProducts.isNotEmpty
                          ? buildGridViewBuilder(state.filteredProducts)
                          : buildNoProduct();
                    } else if (state is Error) {
                      return buildErrorWidget(state.errorMessage);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.darkCerulean,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center buildNoProduct() {
    return Center(
      child: Text(
        'No Product Found',
        style: TextStyles.boldBlack20spW500,
      ),
    );
  }

  GridView buildGridViewBuilder(List<Product> data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .67,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ProductWidget(
        product: data[index],
        lastItems: data.length - 1 == index || data.length - 2 == index,
      ),
    );
  }

  Image buildRouteLogo() {
    return Image.asset(
      routeLogoAsset,
      height: 30,
    );
  }

  Center buildErrorWidget(String errorMsg) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          10.0.margin,
          Text(
            errorMsg,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Row buildSearchBar(BuildContext context, HomeCubit cubit) {
    return Row(
      children: [
        CustomTextFormField(
          width: MediaQuery.sizeOf(context).width - 72,
          height: 50,
          style: TextStyles.normalBlack14spW500,
          hintText: searchHintText,
          onTextChanged: (text) {
            cubit.filterProducts(text);
          },
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.darkCerulean,
          ),
          inputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: AppColors.darkCerulean),
          ),
        ),
        20.0.margin,
        const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.darkCerulean,
          size: 36,
        ),
      ],
    );
  }
}
