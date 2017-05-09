﻿Процедура ДобавитьЗадачуВТекущиеДела(ДопПараметры) Экспорт
	пАвтор = ДопПараметры.Автор;
	МассивЗадач = ДопПараметры.МассивЗадач;
	Для каждого пЗадача из МассивЗадач цикл
		
		//ТекДелоПоЗадаче = ПолучитьТекДелоПоЗадаче(пЗадача,пАвтор);
		//Если ЗначениеЗаполнено(ТекДелоПоЗадаче) Тогда
		//	пНомерЗадачи = Справочники.узЗадачи.ПолучитьНомерЗадачи(пЗадача);
		//	
		//	пТекстСообщения = узОбщийМодульСервер.ПолучитьТекстСообщения("Уже есть текущее дело для задачи #%1 %2",79);
		//	пТекстСообщения = СтрШаблон(пТекстСообщения,пНомерЗадачи,пЗадача);
		//	Сообщить(пТекстСообщения);
		//	Продолжить;
		//Конецесли;
		
		СпрОбъект = СоздатьТекДелоПоЗадаче(пЗадача,пАвтор);
	Конеццикла;	
КонецПроцедуры

Функция СоздатьТекДелоПоЗадаче(пЗадача,пАвтор) 
	
	пНомерЗадачи = Справочники.узЗадачи.ПолучитьНомерЗадачи(пЗадача);
	
	пТекстСообщения = узОбщийМодульСервер.ПолучитьТекстСообщения("Выполнить задачу #%1 %2",78);
	пТекстСообщения = СтрШаблон(пТекстСообщения,пНомерЗадачи,пЗадача);
	
	СпрОбъект = Справочники.узТекущиеДела.СоздатьЭлемент();
	СпрОбъект.Автор = пАвтор;
	СпрОбъект.Задача = пЗадача;
	СпрОбъект.ТекстСодержания = пТекстСообщения;
	СпрОбъект.Наименование = СпрОбъект.ТекстСодержания;
	СпрОбъект.ДатаСоздания = ТекущаяДата();	
	СпрОбъект.ДатаТекущегоДела = СпрОбъект.ДатаСоздания; 
	СпрОбъект.Порядок = 1000;
	СпрОбъект.Записать();
	
	пТекстСообщения = узОбщийМодульСервер.ПолучитьТекстСообщения("Добавлено дело",80);	
	пТекстСообщения = пТекстСообщения + " "+ СпрОбъект.ТекстСодержания;
	Сообщить(пТекстСообщения);
	Возврат СпрОбъект;
КонецФункции 

//Функция ПолучитьТекДелоПоЗадаче(пЗадача,пАвтор) 
//	Перем ТекДелоПоЗадаче;
//	
//	Если НЕ ЗначениеЗаполнено(пЗадача) Тогда
//		Возврат ТекДелоПоЗадаче;
//	Конецесли;
//	
//	
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//	"ВЫБРАТЬ
//	|	узТекущиеДела.Ссылка
//	|ИЗ
//	|	Справочник.узТекущиеДела КАК узТекущиеДела
//	|ГДЕ
//	|	узТекущиеДела.Задача = &Задача
//	|	И узТекущиеДела.Автор = &Автор";
//	
//	Запрос.УстановитьПараметр("Задача", пЗадача);
//	Запрос.УстановитьПараметр("Автор", пАвтор);
//	
//	РезультатЗапроса = Запрос.Выполнить();
//	Если РезультатЗапроса.Пустой() Тогда
//		Возврат ТекДелоПоЗадаче;	
//	Конецесли;
//	
//	Выборка = РезультатЗапроса.Выбрать();
//	Если Выборка.Количество() > 1 Тогда
//		
//		пНомерЗадачи = Справочники.узЗадачи.ПолучитьНомерЗадачи(пЗадача);
//		
//		пТекстСообщения = узОбщийМодульСервер.ПолучитьТекстСообщения("Ошибка! нашли более 1 текущего дела по задаче #%1 %2",77);
//		пТекстСообщения = СтрШаблон(пТекстСообщения,пНомерЗадачи,пЗадача);
//		Сообщить(пТекстСообщения);
//		
//		Возврат ТекДелоПоЗадаче;
//	Конецесли;
//	
//	Выборка.Следующий();
//	
//	ТекДелоПоЗадаче = Выборка.Ссылка;
//	
//	Возврат ТекДелоПоЗадаче;
//КонецФункции 