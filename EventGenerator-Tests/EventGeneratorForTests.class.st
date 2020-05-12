Class {
	#name : #EventGeneratorForTests,
	#superclass : #Object,
	#traits : 'EventGenerator',
	#classTraits : 'EventGenerator classTrait',
	#instVars : [
		'instVar'
	],
	#category : #'EventGenerator-Tests'
}

{ #category : #'as yet unclassified' }
EventGeneratorForTests >> initialize [
	super initialize.
	instVar := 2.
	self initializeDeclareGeneratedEvents.
]

{ #category : #initialization }
EventGeneratorForTests >> initializeDeclareGeneratedEvents [
	"Declare all the names of the events this object can publish, with: self declareGeneratedEvent: anEventName"
	self declareGeneratedEvent: #TestEvent
]

{ #category : #initialization }
EventGeneratorForTests >> makeTestEvent [
	^ 42
]
