"
I represent a validator constraint for type slots.
I constraints values written to the slot to be able to satisfy the predicate written in a block.

	Try This!
	creation: #testSlot satisfy: [ :x | x > 0 ]
	0 would be denied.
	1 would work.
	{} wouldn't understand the message, which would denied it.

	My #predicate variable is a blockclosure, that takes one argument (the value that is written to an iv.)

"
Class {
	#name : #PredicateConstraint,
	#superclass : #AbstractConstraint,
	#instVars : [
		'predicate'
	],
	#category : #TypedSlotHogo
}

{ #category : #'as yet unclassified' }
PredicateConstraint class >> initialSelector [
	^ #satisfy:
]

{ #category : #testing }
PredicateConstraint >> checkConstraint: anObject [
	([ predicate value: anObject ] on: Error do: [ false ]) ifFalse: [ self wasViolatedBy: anObject ]
]

{ #category : #printing }
PredicateConstraint >> definitionStringOn: aStream [
	aStream print: predicate
]

{ #category : #printing }
PredicateConstraint >> hasSamePropertiesAs: aType [
	"we compare ASTs since blocks have other instance variables that may not be the same"
	^ predicate sourceNode = aType predicate sourceNode
]

{ #category : #printing }
PredicateConstraint >> isValidator [
	^ true
]

{ #category : #printing }
PredicateConstraint >> predicate [
	^ predicate
]

{ #category : #printing }
PredicateConstraint >> predicate: aBlock [ 
	predicate := aBlock
]
