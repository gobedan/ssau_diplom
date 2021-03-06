# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cpu_clock = Characteristic.create({name: "Частота процессора", measure_unit: MeasureUnit.create({name: "МГц"}) })
ram = Characteristic.create({name: "Объем оперативной памяти", measure_unit: MeasureUnit.create({name: "ГБ"}) })
waranty = Characteristic.create({name: "Срок гарантии", measure_unit: MeasureUnit.create({name: "мес"}) })

cat1 = Category.create({name: "Компьютеры, ноутбуки и ПО"})
subcat1 = Subcategory.create({name: "Системные блоки", category: cat1})
subcat2 = Subcategory.create({name: "Ноутбуки", category: cat1})
subcat3 = Subcategory.create({name: "Моноблоки", category: cat1})
subcat4 = Subcategory.create({name: "Серверы", category: cat1})
subcat5 = Subcategory.create({name: "Программное обеспечение", category: cat1})

cat2 = Category.create({name: "Комплектующие для ПК"})
subcat6 = Subcategory.create({name: "Процессоры", category: cat2})
subcat7 = Subcategory.create({name: "Материнские платы", category: cat2})
subcat8 = Subcategory.create({name: "Видеокарты", category: cat2})
subcat9 = Subcategory.create({name: "Оперативная память", category: cat2})
subcat10 = Subcategory.create({name: "Жесткие диски", category: cat2})

cat3 = Category.create({name: "Периферия и аксессуары"})
subcat11 = Subcategory.create({name: "Мониторы", category: cat3})
subcat12 = Subcategory.create({name: "Клавиатуры", category: cat3})
subcat13 = Subcategory.create({name: "Мыши", category: cat3})
subcat14 = Subcategory.create({name: "Звуковое оборудование", category: cat3})
subcat15 = Subcategory.create({name: "Полезные аксессуары", category: cat3})


pc1 = Product.create({name: "ПК DEXP Aquilon O242", subcategory: subcat1, price: 16999, picture_url: "https://c.dns-shop.ru/thumb/st1/fit/500/500/fae857a9790811b657722c8fb54d0f86/193f6af82adc9bbffe5dc4ac1ede8a9f545b4996f7052d768f0a1b97984782d8.jpg"})
pc1.characteristics_products.create({characteristic_id: cpu_clock.id, value: 3400})
pc1.characteristics_products.create({characteristic_id: ram.id, value: 8})
pc1.characteristics_products.create({characteristic_id: waranty.id, value: 24})

pc2 = Product.create({name: "ПК HP Slim S01-aF1000ur", subcategory: subcat1, price: 18999, picture_url: "https://c.dns-shop.ru/thumb/st4/fit/500/500/4f5d4b3fcd58b3ac35159d83aa179046/531c772e561b94760e6e8b38117c90ba5c94279b86c3df264428d8324ed52cf6.jpg"})
pc2.characteristics_products.create({characteristic_id: cpu_clock.id, value: 2000})
pc2.characteristics_products.create({characteristic_id: ram.id, value: 4})
pc2.characteristics_products.create({characteristic_id: waranty.id, value: 12})

pc3 = Product.create({name: "ПК DEXP Aquilon O245", subcategory: subcat1, price: 16999, picture_url: "https://c.dns-shop.ru/thumb/st4/fit/500/500/a3abb8849c3ae177c11ead5644869ece/385b67de1d2fb92144a1ea6e3b77a6ed1208ab6a55ca4c04be9f5669915fbe0d.jpg"})
pc3.characteristics_products.create({characteristic_id: cpu_clock.id, value: 3100})
pc3.characteristics_products.create({characteristic_id: ram.id, value: 8})
pc3.characteristics_products.create({characteristic_id: waranty.id, value: 24})

pc4 = Product.create({name: "ПК Dell Vostro 3888", subcategory: subcat1, price: 18999, picture_url: "https://c.dns-shop.ru/thumb/st4/fit/500/500/4292249df56a710083c49559dbefabe2/c42b05c3366c17eae13000622f825c809827bf167c86e00f290d67089ea03ab8.jpg"})
pc4.characteristics_products.create({characteristic_id: cpu_clock.id, value: 4000})
pc4.characteristics_products.create({characteristic_id: ram.id, value: 4})
pc4.characteristics_products.create({characteristic_id: waranty.id, value: 12})

pc5 = Product.create({name: "ПК Acer Aspire TC-390", subcategory: subcat1, price: 25999, picture_url: "https://c.dns-shop.ru/thumb/st1/fit/500/500/19f9f6e3a4aa653d370b65f4ecfd4b9f/23cc32a8656ad5ec1ccbab19ea91624a1f9f3bd6c85435ba28f1e880e1e1dbf9.jpg"})
pc5.characteristics_products.create({characteristic_id: cpu_clock.id, value: 3600})
pc5.characteristics_products.create({characteristic_id: ram.id, value: 8})
pc5.characteristics_products.create({characteristic_id: waranty.id, value: 12})

pc6 = Product.create({name: "ПК HP Slim S01-aF1000ur", subcategory: subcat1, price: 29999, picture_url: "https://c.dns-shop.ru/thumb/st4/fit/500/500/725394e000b922fc15f59d274758ffaa/a6cf514ce2bf61501f1c2e300a926b0fe095295e515520189608d7b55ecb03e5.jpg"})
pc6.characteristics_products.create({characteristic_id: cpu_clock.id, value: 3600})
pc6.characteristics_products.create({characteristic_id: ram.id, value: 8})
pc6.characteristics_products.create({characteristic_id: waranty.id, value: 12})
