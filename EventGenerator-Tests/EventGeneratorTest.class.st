Class {
	#name : #EventGeneratorTest,
	#superclass : #TestCase,
	#category : #'EventGenerator-Tests'
}

{ #category : #tests }
EventGeneratorTest >> testReceiveEvent [
	| generator subscriber event |
	generator := EventGeneratorForTests new.
	subscriber := EventSubscriberForTests new.
	generator subscribe: subscriber toCall: #callbackForTestEvent: onEvent: #TestEvent.
	event := generator makeTestEvent.
	generator publish: event asEventNamed: #TestEvent.
	self assert: subscriber eventReceived equals: event.
	
]
