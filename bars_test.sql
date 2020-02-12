--
-- База данных: `bars_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `D_AGENTS`
--

CREATE TABLE `D_AGENTS` (
  `ID` int(17) NOT NULL,
  `FIRSTNAME` varchar(40) DEFAULT NULL,
  `SURNAME` varchar(40) DEFAULT NULL,
  `LASTNAME` varchar(40) DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  `SEX` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `D_BLOODGROUPE`
--

CREATE TABLE `D_BLOODGROUPE` (
  `ID` int(17) NOT NULL,
  `BG_CODE` varchar(26) NOT NULL,
  `BG_NAME` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `D_BLOODGROUPE`
--

INSERT INTO `D_BLOODGROUPE` (`ID`, `BG_CODE`, `BG_NAME`) VALUES
(1, 'AB IV', 'Четвертая'),
(2, 'A II', 'Вторая'),
(3, 'B III', 'Третья'),
(4, 'O I', 'Первая');

-- --------------------------------------------------------

--
-- Структура таблицы `D_LPU`
--

CREATE TABLE `D_LPU` (
  `ID` int(17) NOT NULL,
  `FULLNAME` varchar(250) NOT NULL,
  `HEADDOCTOR_FULLNAME` varchar(160) NOT NULL,
  `FULLADDRESS` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `D_PERSMEDCARD`
--

CREATE TABLE `D_PERSMEDCARD` (
  `ID` int(17) NOT NULL,
  `BLOODGROUPE` int(17) DEFAULT NULL,
  `RHESUS` int(1) DEFAULT NULL,
  `CARD_NUMB` varchar(26) DEFAULT NULL,
  `AGENT` int(17) NOT NULL,
  `LPU` int(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `D_AGENTS`
--
ALTER TABLE `D_AGENTS`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `D_BLOODGROUPE`
--
ALTER TABLE `D_BLOODGROUPE`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `D_LPU`
--
ALTER TABLE `D_LPU`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `D_PERSMEDCARD`
--
ALTER TABLE `D_PERSMEDCARD`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `AGENT` (`AGENT`,`LPU`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `D_AGENTS`
--
ALTER TABLE `D_AGENTS`
  MODIFY `ID` int(17) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `D_BLOODGROUPE`
--
ALTER TABLE `D_BLOODGROUPE`
  MODIFY `ID` int(17) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `D_LPU`
--
ALTER TABLE `D_LPU`
  MODIFY `ID` int(17) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `D_PERSMEDCARD`
--
ALTER TABLE `D_PERSMEDCARD`
  MODIFY `ID` int(17) NOT NULL AUTO_INCREMENT;
COMMIT;
