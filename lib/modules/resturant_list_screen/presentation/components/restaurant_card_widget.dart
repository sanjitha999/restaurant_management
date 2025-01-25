import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant_management/modules/business_overview/model/business_screen_args_model.dart';
import 'package:resturant_management/modules/resturant_list_screen/bloc/restaurant_list_bloc.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    required this.restaurantName,
    required this.address,
    required this.businessId,
    required this.isApproved,
    required this.imageId,
  });

  final String restaurantName;
  final String address;
  final String businessId;
  final bool isApproved;
  final String imageId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isApproved) {
          Navigator.of(context).pushNamed(
            Routes.restaurantDashboardRoute,
            arguments: businessId,
          );
        } else {
          Navigator.of(context).pushNamed(
            Routes.businessOverviewRoute,
            arguments: BusinessScreenArgsModel(
              businessId: businessId,
              isPending: true,
            ),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildImage(context)),
            SizedBoxSpacing.width20,
            Flexible(flex: 4, child: _buildRestaurantDetails()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return VisibilityDetector(
      key: Key('${businessId}_image_$imageId'),
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage >= 50) {
          BlocProvider.of<RestaurantListBloc>(context).add(FetchBusinessImage(
              businessId: businessId ?? '', imageId: imageId ?? ''));
        }
      },
      child: BlocBuilder<RestaurantListBloc, RestaurantListState>(
        buildWhen: (previous, current) => current is BusinessImagesState,
        builder: (context, state) {
          if (state is BusinessImagesState) {
            // var image = state.cachedImages?.getImage('${businessId}_image_$imageId');
            var image = BlocProvider.of<RestaurantListBloc>(context)
                .businessImageCache
                ?.getImage('${businessId}_image_$imageId');

            if (image != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  // Set aspect ratio as 1 to make it a square container
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius12),
                      color: AppColors.textGrey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius12),
                      child: Image.memory(
                        image,
                        fit: BoxFit
                            .cover, // Ensures the image fills the container
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return _buildAddImageWidget(context);
            }
          } else {
            return _buildAddImageWidget(context);
          }
        },
      ),
    );
  }

  Widget _buildAddImageWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RestaurantListBloc>(context).add(UploadBusinessImage(
          imageSource: ImageSource.gallery,
          businessId: businessId,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1, // Set aspect ratio as 1 to make it a square container
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius12),
              color: AppColors.textGrey,
            ),
            child: const Center(
              child: Icon(
                // Icons.image,
                Icons.add_a_photo,
                color: Colors.white70,
                size: 50,
              ), // Placeholder icon for visual indication
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    restaurantName,
                    style: TextStyleConst.title,
                    softWrap: true,
                  ),
                ),
                SizedBoxSpacing.height10,
                Flexible(
                  child: Text(
                    address,
                    softWrap: true,
                    style: const TextStyle(
                      color: AppColors.shadowGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBoxSpacing.width20,
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.successGreen,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),
              child: const Row(
                children: [
                  Text(
                    "4.5",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBoxSpacing.width2,
                  Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
