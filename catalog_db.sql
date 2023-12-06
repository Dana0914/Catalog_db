
-- Схема для хранения товаров и характеристик товаров специфических для каждой
-- отдельно взятой категории.

-- В схеме должна быть возможность хранения категорий у каждой из которых может
-- быть свой перечень характеристик, например категория `Процессоры` с
-- характеристиками `Производитель`, `Количество ядер`, `Сокет` или категория
-- `Мониторы` с характеристиками `Производитель`, `Диагональ`, `Матрица`,
-- `Разрешение`.

-- Процессоры      -> Intel Core I9 9900 -> AMD Ryzen R7 7700
-- Производитель   -> Intel              -> AMD
-- Количество ядер -> 8                  -> 12
-- Сокет           -> 1250               -> AM4

-- Мониторы      -> Samsung SU556270 -> AOC Z215S659
-- Производитель -> Samsung          -> AOC
-- Диагональ     -> 27               -> 21.5
-- Матрица       -> TN               -> AH-IPS
-- Разрешение    -> 2560*1440        -> 1920*1080


create table categories (
    id serial8        not null,
    name varchar (40) not null,
    primary key (id)
);

create table items (
    id serial8              not null,
    category_id int8        not null,
    item_names varchar (40) not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

create table characteristics (
    id       serial8     not null,
    category_id int8        not null,
    name     varchar(40) not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

insert into categories (name)
values ('processors'),
       ( 'monitors');

insert into items (category_id, item_names)
values (1,'Intel Core I9 9900'),
       (1,'AMD Ryzen R7 7700'),
       (2,'Samsung SU556270'),
       (2, 'AOC Z215S659');

insert into characteristics (category_id, name)
values (1, 'manufacturer' ),
       (1, 'amount_of_cores'),
       (1, 'socket'),
       (2, 'manufacturer'),
       (2, 'diagonal'),
       (2, 'matrix'),
       (2, 'resolution');

create table values (
    id serial8 not null,
    characteristic_id int8 not null,
    items_id int8 not null,
    values varchar (40) not null,
    primary key (id),
    foreign key (characteristic_id) references characteristics (id),
    foreign key (items_id) references items (id)
);

insert into values (characteristic_id, items_id, values)
values (1, 1,'Intel'),
(2, 1,'8'),
(3, 1,'1250'),
(4, 2,'Samsung'),
(5, 2,'27'),
(6, 2,'TN'),
(7,2,'2560*1440'),
(1, 1,'AMD'),
(2,1,'12'),
(3, 1,'AM4'),
(4,2,'AOC'),
(5,2,'21.5'),
(6,2,'AH-IPS'),
(7,2,'1920*1080');


