<p align="center">
    <h1 align="center">BarsGroup-database</h1>
    <h2 align="center">Тестовое задание. Часть DATABASE</h2>
</p>


### Описание приложения:

В каталоге расположен файл `bars_test.sql`, который является дампом и содержит структуру таблиц БД.

Константы:

1. `SEX` - 0 - мужской пол, 1 - женский пол
2. `RHESUS` - 0 - отрицательный резус, 1 - положительный резус

### Задание 1.

Количество всех контрагентов с 4-ой положительной группой крови, где:

1. `FULLNAME` - Наименование лечебного учреждения
2. `COUNT` - Количество контрагентов

```sql
SELECT `t4`.`FULLNAME` AS `FULLNAME`, COUNT(`t1`.`ID`) AS `COUNT`  
FROM `D_AGENTS` AS `t1` 
INNER JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`ID` = `t2`.`AGENT`
INNER JOIN `D_BLOODGROUPE` AS `t3` ON `t3`.`ID` = `t2`.`BLOODGROUPE`
INNER JOIN `D_LPU` AS `t4` ON `t4`.`ID` = `t2`.`LPU`
WHERE `t2`.`RHESUS` = 1 AND `t3`.`BG_CODE` = 'AB IV'
GROUP BY `t4`.`FULLNAME`
```

### Задание 2.

Количество всех контрагентов, у которых нет карт ни в одном лечебном учреждении, где:

1. `COUNT` - Количество контрагентов

```sql
SELECT COUNT(`t1`.`ID`) AS `COUNT`
FROM `D_AGENTS` AS `t1` 
LEFT JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`ID` = `t2`.`AGENT`
WHERE `t2`.`ID` IS NULL
```

### Задание 3.

Фамилии контрагентов, у которых нет карт ни в одном лечебном учреждении, где:

1. `SURNAME` - Фамилия контрагента

```sql
SELECT `t1`.`SURNAME` AS `SURNAME`
FROM `D_AGENTS` AS `t1` 
LEFT JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`ID` = `t2`.`AGENT`
WHERE `t2`.`ID` IS NULL
```

### Задание 4.

ФИО всех контрагентов, а также их номера карт, при наличии, где:

1. `SURNAME` - Фамилия контрагента
2. `FIRSTNAME` - Имя контрагента
3. `LASTNAME` - Отчество контрагента
4. `CARD_NUMB` - Номер карты

```sql
SELECT `t1`.`SURNAME`, `t1`.`FIRSTNAME`, `t1`.`LASTNAME`, `t2`.`CARD_NUMB`
FROM `D_AGENTS` AS `t1` 
LEFT JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`ID` = `t2`.`AGENT`
```

### Задание 5.

Процент женщин по таблице контрагентов в разрезе лечебного учреждения, где:

1. `LPU` - Лечебное учреждение
2. `PERSENT` - Процент женщин

```sql
SELECT `t2`.`LPU` AS `LPU`, `t3`.`COUNT`/ COUNT(`t1`.`ID`)*100 AS `PERSENT`
FROM `D_AGENTS` AS `t1` 
INNER JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`id` = `t2`.`agent` 
INNER JOIN (
  SELECT `t2`.`LPU`, COUNT(`t1`.`ID`) AS `COUNT` 
  FROM `D_AGENTS` AS `t1` 
  INNER JOIN `D_PERSMEDCARD` AS `t2` ON `t1`.`id` = `t2`.`AGENT` 
  WHERE `SEX` = 1 
  GROUP BY `LPU`
) As `t3` ON `t3`.`LPU` = `t2`.`LPU` 
GROUP BY `t2`.`LPU`
```