"
Use this trait in a class to turn it into an event generator that other classes can subscribe to.

# Requirements
The class using this trait needs to:
- define the #initializeDeclareGeneratedEvents method to declare the names of all the events it can generate
- call the  `self initializeDeclareGeneratedEvents` in its own #intialization method

# Subscribing
Let's say ""pizzeria"" is an instance of a class using this trait.
Let's say ""consumer"" is the object that wants to get notified for the event named #PizzaReady.
Write:
> `pizzeria subscribe: consumer toCall: #eatPizza: onEvent: #PizzaReady`
When the pizzeria publishes a pizza under the name #PizzaReady, the consumer>>#eatPizza: method will be called, with the pizza as the argument.
Subscribers have to register a method name that accepts exactly one argument.

# Publishing
Write:
> `pizzeria publish: aPizza asEventNamed: #PizzaEvent`
All the objects that subscribed to the event name #PizzaReady will have the callback they registered be called with `aPizza` as argument.

# Instance Variables
- eventNameToSubscriptionsDictionary: Dictionary{Symbol. WeakIdentityKeyDictionary{Object. Symbol}}
Keys are the names of the events. Values are the subscriptions to that event name. The subscriptions are stored in a WeakIdentityKeyDictionary so that the subscribers can be garbage collected. A subscription has the subscriber object as key, and the selector to be called on that object when the event is published.

"
Trait {
	#name : #EventGenerator,
	#instVars : [
		'eventNameToSubscriptionsDictionary'
	],
	#category : #EventGenerator
}

{ #category : #eventGenerator }
EventGenerator >> declareGeneratedEvent: anEventName [
	"anEventName: Symbol"
	self eventNameToSubscriptionsDictionary at: anEventName put: WeakIdentityKeyDictionary new
]

{ #category : #eventGenerator }
EventGenerator >> eventNameToSubscriptionsDictionary [
	eventNameToSubscriptionsDictionary ifNil: [ eventNameToSubscriptionsDictionary := Dictionary new].
	^ eventNameToSubscriptionsDictionary
]

{ #category : #initialization }
EventGenerator >> initializeDeclareGeneratedEvents [
	"Declare all the names of the events this object can publish, with: self declareGeneratedEvent: anEventName. This method must be called in the #initialize method of the class this trait is used in"
	self subclassResponsibility
]

{ #category : #eventGenerator }
EventGenerator >> publish: anObject asEventNamed: anEventName [
	" Look for all the objects that subscribed to @anEventName. Call the selector they declared in their subscription with @anObject as argument
	- anObject: Object. The event to be published
	- anEventName: Symbol. The name under which to publish the event
	"
	self eventNameToSubscriptionsDictionary at: anEventName ifPresent: [:subscriptionDictionary |
		subscriptionDictionary associationsDo: [ :assoc |
			assoc key perform: assoc value with: anObject.	
		]
	] ifAbsent: [
		PublishingUndeclaredEvent signal
	].
]

{ #category : #eventGenerator }
EventGenerator >> subscribe: anObject toCall: aSelector onEvent: anEventName [
	"When an event named @anEventName will be published by the receiver, the method named @aSelector of @anObject will be called, with the event object as argument (so the @aSelector method needs to accept exactly one argument )
	- anObject: Object. The object to subscribe to the event
	- aSelector: Symbol. The name of the method to call on the subscribed object when the event is published
	- anEventName: aSymbol. The name of the event for which to subscribe @anObject
	"
	aSelector isSymbol ifFalse: [ self error: 'aSelector is not a symbol' ].
	self eventNameToSubscriptionsDictionary at: anEventName ifPresent: [:subscriptionsDictionary|
			subscriptionsDictionary at: anObject put: aSelector.
	] ifAbsent: [
		SubscribingToUndeclaredEvent signal.
	].
]
