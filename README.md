# EventGenerator
Use the `EventGenerator` trait in a class to turn it into an event generator that other classes can subscribe to.

## Installation
```Smalltalk
Metacello new
    baseline: 'EventGenerator';
    repository: 'github://dupriezt/EventGenerator';
    load.
```

## Requirements
The class using this trait needs to:
- define the #initializeDeclareGeneratedEvents method to declare the names of all the events objects of this class can generate. To declare an event: `self declareGeneratedEvent: anEventName`, where `anEventName` is a symbol.
- call the  `self initializeDeclareGeneratedEvents` in its own #intialization method

## Subscribing
Let's say "pizzeria" is an instance of a class using this trait.
Let's say "consumer" is the object that wants to get notified for the event named #PizzaReady.
Write:
> `pizzeria subscribe: consumer toCall: #eatPizza: onEvent: #PizzaReady`
When the pizzeria publishes a pizza under the name #PizzaReady, the consumer>>#eatPizza: method will be called, with the pizza as the argument.
Subscribers have to register a method name that accepts exactly one argument.

## Publishing
Write:
> `pizzeria publish: aPizza asEventNamed: #PizzaEvent`
All the objects that subscribed to the event name #PizzaReady will have the callback they registered be called with `aPizza` as argument.
