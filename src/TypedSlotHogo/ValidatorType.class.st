Class {
	#name : #ValidatorType,
	#superclass : #AbstractType,
	#instVars : [
		'predicate'
	],
	#category : #TypedSlotHogo
}

{ #category : #'as yet unclassified' }
ValidatorType class >> initialSelector [
	^ #satisfy:
]

{ #category : #testing }
ValidatorType >> checkObjectType: anObject [
	[ predicate value: anObject ] on: Error do: [ self typeViolationWith: anObject ]
]

{ #category : #printing }
ValidatorType >> definitionStringOn: aStream [
	aStream print: predicate
]

{ #category : #printing }
ValidatorType >> hasSameTypeAs: aType [
	^ predicate = aType predicate
]

{ #category : #printing }
ValidatorType >> predicate [
	^ predicate
]

{ #category : #printing }
ValidatorType >> predicate: aBlock [ 
	predicate := aBlock
]
