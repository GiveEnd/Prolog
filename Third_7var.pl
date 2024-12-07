% База данных
:- dynamic client/5.  % Факты о клиентах
:- dynamic sale/8.   % Факты о продажах
:- dynamic product/7. % Факты о товарах

% Меню программы
main :-
    repeat,
    nl, write('Меню программы:'), nl,
    write('1 - Добавить клиента'), nl,
    write('2 - Добавить продажу'), nl,
    write('3 - Добавить товар'), nl,
    write('4 - Показать всех клиентов'), nl,
    write('5 - Показать все продажи'), nl,
    write('6 - Показать все товары'), nl,
    write('7 - Найти продажи клиента'), nl,
    write('8 - Удалить клиента'), nl,
    write('0 - Выход из программы'), nl,
    write(' > '), read(Choice),
    menu_do(Choice),
    Choice = 0, !.

% Реализация меню
menu_do(1) :- add_client.
menu_do(2) :- add_sale.
menu_do(3) :- add_product.
menu_do(4) :- list_clients.
menu_do(5) :- list_sales.
menu_do(6) :- list_products.
menu_do(7) :- find_sales_by_client.
menu_do(8) :- delete_client.
menu_do(0) :- write('Выход из программы...'), nl.
menu_do(_) :- write('Неверный выбор!'), nl.

% Добавление клиента
%add_client :-
%    write('Введите данные продажи:'), nl,
%    write('ФИО: '), read(FIO),
%    write('Адрес: '), read(Address),
%    write('Телефон: '), read(Phone),
%    write('Адрес выставления счета: '), read(BillAddress),
%    write('Номер карточки: '), read(CardNumber),
%    assertz(client(FIO, Address, Phone, BillAddress, CardNumber)),
%    write('Клиент добавлен!'), nl.

add_client :-
    write('Vvediteb danie prodaji:'), nl,
    write('FIO: '), read(FIO),
    write('Adres: '), read(Address),
    write('Phone: '), read(Phone),
    write('Bill: '), read(BillAddress),
    write('Number card: '), read(CardNumber),
    assertz(client(FIO, Address, Phone, BillAddress, CardNumber)),
    write('Клиент добавлен!'), nl.

% Добавление продажи
add_sale :-
    write('Введите данные продажи:'), nl,
    write('ФИО клиента: '), read(FIO),
    write('Наименование товара: '), read(Name),
    write('Модель: '), read(Model),
    write('Поставка из (магазин/склад): '), read(Supply),
    write('Количество: '), read(Quantity),
    write('Общая стоимость: '), read(TotalPrice),
    write('Размер скидки: '), read(Discount),
    write('Форма оплаты: '), read(PaymentMethod),
    assertz(sale(FIO, Name, Model, Supply, Quantity, TotalPrice, Discount, PaymentMethod)),
    write('Продажа добавлена!'), nl.

% Добавление товара
add_product :-
    write('Введите данные товара:'), nl,
    write('Категория: '), read(Category),
    write('Модель: '), read(Model),
    write('Название производителя: '), read(Manufacturer),
    write('Адрес производителя: '), read(ManufacturerAddress),
    write('Цена: '), read(Price),
    write('Количество в магазине: '), read(StoreQuantity),
    write('Количество на складе: '), read(WarehouseQuantity),
    assertz(product(Category, Model, Manufacturer, ManufacturerAddress, Price, StoreQuantity, WarehouseQuantity)),
    write('Товар добавлен!'), nl.

% Список всех клиентов
list_clients :-
    write('Clients:'), nl,
    forall(client(FIO, Address, Phone, BillAddress, CardNumber),
           (write(FIO), write(', '), write(Address), write(', '), write(Phone), nl)).
           
% Список всех продаж
list_sales :-
    write('Sales:'), nl,
    forall(sale(FIO, Name, Model, Supply, Quantity, TotalPrice, Discount, PaymentMethod),
           (write(FIO), write(' купил '), write(Name), write(' (модель: '), write(Model), write(')'), nl)).

% Список всех товаров
list_products :-
    write('Tovari:'), nl,
    forall(product(Category, Model, Manufacturer, ManufacturerAddress, Price, StoreQuantity, WarehouseQuantity),
           (write(Category), write(', '), write(Model), write(', '), write(Manufacturer), nl)).

% Найти продажи по ФИО клиента
find_sales_by_client :-
    write('Vvedite FIO: '), read(FIO),
    write('Prodajui clienta:'), nl,
    forall(sale(FIO, Name, Model, Supply, Quantity, TotalPrice, Discount, PaymentMethod),
           (write('Tovar: '), write(Name), write(', model;: '), write(Model), write(', count: '), write(Quantity), nl)).

% Удаление клиента
delete_client :-
    write('Vvedite FIO dlya udalenia: '), read(FIO),
    retractall(client(FIO, _, _, _, _)),
    retractall(sale(FIO, _, _, _, _, _, _, _)),
    write('Clietn and sales deleted!'), nl.
