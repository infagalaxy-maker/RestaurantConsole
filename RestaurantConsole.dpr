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
