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
	([ predicate value: anObject ] on: Error do: [ false ]) ifFalse: [ self typeViolationWith: anObject ]
]

{ #category : #printing }
ValidatorType >> definitionStringOn: aStream [
	aStream print: predicate
]

{ #category : #printing }
ValidatorType >> hasSameTypeAs: aType [
	"we compare ASTs since blocks have other instance variables that may not be the same"
	^ predicate sourceNode = aType predicate sourceNode
]

{ #category : #printing }
ValidatorType >> isValidator [
	^ true
]

{ #category : #printing }
ValidatorType >> predicate [
	^ predicate
]

{ #category : #printing }
ValidatorType >> predicate: aBlock [ 
	predicate := aBlock
]
