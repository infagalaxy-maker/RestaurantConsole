program RestaurantConsole;

{$APPTYPE CONSOLE}
uses
  SysUtils;

type
  TDish = record
    Code: Integer;
    Name: string[50];
    Description: string[100];
    Price: Real;
  end;
  TOrder = record
    OrderNumber: Integer;
    TableNumber: Integer;
    DishCode: Integer;
    Quantity: Integer;
  end;
  PDishNode = ^TDishNode;
  TDishNode = record
    Data: TDish;
    Next: PDishNode;
  end;
  POrderNode = ^TOrderNode;
  TOrderNode = record
    Data: TOrder;
    Next: POrderNode;
  end;
var
  DishHead: PDishNode = nil;
  OrderHead: POrderNode = nil;
{ ================= ДОБАВЛЕНИЕ БЛЮДА ================= }
procedure AddDish;
var
  D: TDish;
  NewNode: PDishNode;
begin
  Write('Код блюда: ');
  ReadLn(D.Code);
  Write('Название: ');
  ReadLn(D.Name);
  Write('Описание: ');
  ReadLn(D.Description);
  Write('Цена: ');
  ReadLn(D.Price);
  New(NewNode);
  NewNode^.Data := D;
  NewNode^.Next := DishHead;
  DishHead := NewNode;
  WriteLn('Блюдо добавлено');
  WriteLn;
end;
{ ================= ПОКАЗ БЛЮД ================= }
procedure ShowDishes;
var
  P: PDishNode;
begin
  P := DishHead;
  WriteLn;
  WriteLn('===== СПИСОК БЛЮД =====');
  while P <> nil do
  begin
    WriteLn(
      'Код: ', P^.Data.Code,
      ' | Название: ', P^.Data.Name,
      ' | Цена: ', P^.Data.Price:0:2);
    P := P^.Next;
  end;
  WriteLn;
end;
{ ================= УДАЛЕНИЕ БЛЮДА ================= }
procedure DeleteDish;
var
  Code: Integer;
  Current, Prev: PDishNode;
begin
  Write('Введите код блюда: ');
  ReadLn(Code);
  Current := DishHead;
  Prev := nil;
  while Current <> nil do
  begin
    if Current^.Data.Code = Code then
    begin
      if Prev = nil then
        DishHead := Current^.Next
      else
        Prev^.Next := Current^.Next;
      Dispose(Current);
      WriteLn('Блюдо удалено');
      Exit;
    end;
    Prev := Current;
    Current := Current^.Next;
  end;
  WriteLn('Блюдо не найдено');
end;
{ ================= РЕДАКТИРОВАНИЕ ================= }
procedure EditDish;
var
  Code: Integer;
  NewPrice: Real;
  NewDesc: string;
  P: PDishNode;
begin
  Write('Введите код блюда: ');
  ReadLn(Code);
  P := DishHead;
  while P <> nil do
  begin
    if P^.Data.Code = Code then
    begin
      Write('Новая цена: ');
      ReadLn(NewPrice);
      Write('Новое описание: ');
      ReadLn(NewDesc);
      P^.Data.Price := NewPrice;
      P^.Data.Description := NewDesc;
      WriteLn('Блюдо изменено');
      Exit;
    end;
    P := P^.Next;
  end;
  WriteLn('Блюдо не найдено');
end;
{ ================= СОРТИРОВКА ================= }
procedure SortDishesByPrice;
var
  I, J: PDishNode;
  Temp: TDish;
begin
  I := DishHead;
  while I <> nil do
  begin
    J := I^.Next;
    while J <> nil do
    begin
      if I^.Data.Price > J^.Data.Price then
      begin
        Temp := I^.Data;
        I^.Data := J^.Data;
        J^.Data := Temp;
      end;
      J := J^.Next;
    end;
    I := I^.Next;
  end;
  Writeln('Сортировка выполнена');
end;
{ ================= ПОИСК ================= }
procedure SearchDish;
var
  MinPrice, MaxPrice: Real;
  P: PDishNode;
begin
  Write('Минимальная цена: ');
  ReadLn(MinPrice);
  Write('Максимальная цена: ');
  ReadLn(MaxPrice);
  P := DishHead;
  WriteLn;
  WriteLn('Результаты поиска:');
  while P <> nil do
  begin
    if (P^.Data.Price >= MinPrice) and
       (P^.Data.Price <= MaxPrice) then
    begin
      WriteLn(
        P^.Data.Code,
        ' | ',
        P^.Data.Name,
        ' | ',
        P^.Data.Price:0:2
      );
    end;
    P := P^.Next;
  end;
  WriteLn;
end;
begin
repeat WriteLn('========== МЕНЮ ==========');
  WriteLn('1 - Добавить блюдо');
  WriteLn('2 - Показать блюда');
  WriteLn('3 - Удалить блюдо');
  WriteLn('4 - Редактировать блюдо');
  WriteLn('5 - Сортировать блюда');
  WriteLn('6 - Поиск блюда');
  WriteLn('7 - Добавить заказ');
  WriteLn('8 - Показать заказы');
  WriteLn('9 - Выход с сохранением');
  WriteLn('0 - Выход без сохранения');
  Write('Выбор: ');
  ReadLn(Choice);
case Choice of
9: Break;
    end;
  until False;
end.
