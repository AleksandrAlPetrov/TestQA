﻿#language: ru

@tree

Функционал: сценарный тест на добавление значения в поле Количество при добавлении Услуги в документ Заказ (подсистема Продажи)

Как администратор я хочу
создание документа Заказ (подсистема Продажи) 
чтобы добавить значение в поле Количество при добавлении Услуги в табличную часть документа

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа заказ при добавлении Услуги и возможности редактированиия поля "Количество"
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И я нажимаю на кнопку открытия поля с именем "ТоварыТовар"
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000037' | 'Доставка'     |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения товарной части
	Тогда таблица "Товары" стала равной:
		| 'Товар'    | 'Цена'   | 'Количество' |
		| 'Доставка' | '250,00' | '2'          |
* Номер	
	И я запоминаю значение поля с именем "Номер" как "$Номер$"
* Закрытие документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |