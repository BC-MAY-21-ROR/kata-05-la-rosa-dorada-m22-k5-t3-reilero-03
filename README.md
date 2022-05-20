![BrightCoders Logo](img/logo-bc.png)

# Kata Gilded Rose Refactoring
![cover](img/cover.jpg)

## Pre-requisitos
Para evaluar tu código e identificar posibles mejoras debes instalar y utilizar las siguientes herramientas:

- [Rubocop](https://brightcoder.gitbook.io/handbook/recursos/ruby-on-rails/rubocop)
- [Rubycritic](https://brightcoder.gitbook.io/handbook/recursos/ruby-on-rails/rubycritic)
- [SandiMeter](https://github.com/makaroni4/sandi_meter)

## Requerimientos funcionales

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

**IMPORTANTE** En [este enlace](https://github.com/emilybache/GildedRose-Refactoring-Kata) encontrarás una descripción detallada del algoritmo así como el [CODIGO INICIAL](https://github.com/emilybache/GildedRose-Refactoring-Kata)

## Requerimientos no-funcionales
- Calidad
  - Utilizar estilo de código definido por la comunidad (apoyarse en Rubocop)
  - Pruebas unitarias (TDD)
  - Puntuación en Rubycritic por lo menos 85 en la carpeta de la App y por lo menos 65 en las pruebas
  - Utilizar [SandiMeter](https://github.com/makaroni4/sandi_meter) para analizar el código y utilizar el resultado para hacer mejoras
- Ejecución
  - Puede ejecutarse desde la linea de comandos y mostrar la salida en consola
- Código fuente
  - Orientado a Objetos 
  - Métodos Pequeños
  - [Aplicar los principios SOLID](https://rubygarage.org/blog/solid-principles-of-ood)
- Otros
  - Incluir en el repositorio el [SmallBadge](https://github.com/jorge27/tutorial-rubycritic-small-badge) con la puntuación obtenida por - RubyCritic
  - Incluir en el repositorio el reporte HTML que genera [SandiMeter](https://github.com/makaroni4/sandi_meter)
  - Los commits de Git deben ser atómicos y significativos

## Tecnologías
- Lenguaje de programación Ruby
- Framework para pruebas [Rspec](https://rspec.info/) ó [Minitest](https://github.com/seattlerb/minitest)
- Rubocop, RubyCritic y SandiMeter para calidad de código
- Línea de comando

## Entregable
- Código fuente en Github

## Enlaces
[Encuentra aquí una lista completa de recursos de ayuda](https://brightcoder.gitbook.io/handbook/ruby-on-rails)

### The Gilded Rose Refactoring Kata
- [The Gilded Rose Refactoring Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata)

