# Tutorial MobX

Documentação de estudo rápido para Mobx


## Método apenas com as dependências Mobx e flutter_mobx

### Dentro do Controller

```dart
Action increment;

Construtor() {
    increment = Action(_increment);
}

Observable<int> _count = Observable(0);

int get count => _count.value;

void _increment() {
    _count.value++;
}
```

### Usando no widget

```dart
var counter = Construtor();

Observer( builder: (_) { return Text('${counter.count}');},),
```

## Método com as dev-dependências mobx_codegen e build_runner
Código para gerar os arquivos apenas uma vez: `flutter packages pub run build_runner build`
Código para gerar os arquivos sempre que atualizar: `flutter packages pub run build_runner watch`

Passo 1:
> crie um arquivo para gerenciar os estados com o mobx

```dart
part 'controller_mobx.g.dart';

class ControllerMobx = _ControllerMobx with _$ControllerMobx;

// with --> justa as classes
// Store --> sinaliza que esse documento deve ser todo observado
abstract class _ControllerMobx with Store {
@observable
int count = 0;

@action
void increment() {
    count++;
}
}
```
## O mobx tem um listner por padrão, chamdo de autorun


```dart
_Contrutor() {
    autorun((_){
        <!-- Toda mudança de um observable é escutada aqui -->
    });
}
```