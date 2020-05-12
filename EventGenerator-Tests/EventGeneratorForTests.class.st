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

{ #category : #initialization }
EventGeneratorForTests >> declareGeneratedEvents [
	"Declare all the names of the events this object can publish, with: self declareGeneratedEvent: anEventName"
	self declareGeneratedEvent: #TestEvent
]

{ #category : #initialization }
EventGeneratorForTests >> initialize [
	super initialize.
	instVar := 2.
	self declareGeneratedEvents.
]

{ #category : #initialization }
EventGeneratorForTests >> makeTestEvent [
	^ 42
]
