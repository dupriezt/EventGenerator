"
I am a baseline to define the structure and dependencies of the EventGenerator project.
"
Class {
	#name : #BaselineOfEventGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfEventGenerator
}

{ #category : #baseline }
BaselineOfEventGenerator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'EventGenerator';
				package: 'EventGenerator-Tests' with: [ spec requires: #('EventGenerator') ].
			"Groups"
			spec
				group: 'Core' with: #('EventGenerator');
				group: 'Tests' with: #('EventGenerator') ].
]

{ #category : #accessing }
BaselineOfEventGenerator >> projectClass [
	^ MetacelloCypressBaselineProject
]
