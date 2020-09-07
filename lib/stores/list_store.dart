import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {

  //observables são as variáveis observaveis para saber se houve mudança
  @observable
  String newTodoTitle = "";

  ObservableList<String> todoList = ObservableList<String>();

  //actions
  @action
  void setNewTodoTitle (value) => newTodoTitle = value;

  @action
  void addTodo() => todoList.add(newTodoTitle);

  //computeds
  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

}