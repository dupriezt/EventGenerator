Class {
	#name : #ExampleEventGenerator,
	#superclass : #Object,
	#traits : 'EventGenerator',
	#classTraits : 'EventGenerator classTrait',
	#category : #EventGenerator
}

{ #category : #initialization }
ExampleEventGenerator >> initialize [
	super initialize.
	self initializeDeclareGeneratedEvents.
]

{ #category : #initialization }
ExampleEventGenerator >> initializeDeclareGeneratedEvents [
	"Declare all the names of the events this object can publish, with: self declareGeneratedEvent: anEventName. This method must be called in the #initialize method of the class this trait is used in"
	self declareGeneratedEvent: #NameOfMyEvent. 
]

{ #category : #initialization }
ExampleEventGenerator >> publishMyEvent [
	self publish: 'any value to be sent to subscribers' asEventNamed: #NameOfMyEvent
]
