part of 'home_cubit.dart';

sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomePickCategory extends HomeState {
  final ProductCategory category;

  HomePickCategory({required this.category});

  @override
  List<Object?> get props => [
        category,
      ];
}
