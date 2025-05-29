part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int tabIndex;

  const NavigationState({required this.tabIndex});

  NavigationState copyWith({int? tabIndex}) {
    return NavigationState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object> get props => [tabIndex];
}