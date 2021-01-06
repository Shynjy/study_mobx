import 'package:mobx/mobx.dart';

// MobX Apenas com a dependencia mobx e flutter mobx
// class ControllerMobx{
//   Action increment;

//   ControllerMobx() {
//     increment = Action(_increment);
//   }

//   Observable<int> _count = Observable(0);
//   int get count => _count.value;

//   void _increment() {
//     _count.value++;
//   }
// }

part 'controller_mobx.g.dart';

class ControllerMobx = _ControllerMobx with _$ControllerMobx;

// MobX com as dev-dependências mobx_codegen e build_runner
abstract class _ControllerMobx with Store {
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }
}