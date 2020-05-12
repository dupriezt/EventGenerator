Class {
	#name : #EventSubscriberForTests,
	#superclass : #Object,
	#instVars : [
		'eventReceived'
	],
	#category : #'EventGenerator-Tests'
}

{ #category : #'as yet unclassified' }
EventSubscriberForTests >> callbackForTestEvent: testEvent [
	eventReceived := testEvent
]

{ #category : #'as yet unclassified' }
EventSubscriberForTests >> eventReceived [
	^ eventReceived
]
