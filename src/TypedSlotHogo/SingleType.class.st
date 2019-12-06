"
I represent Single type constraint.

	Try This!
	creation: #anIV type: String.
	'astring' could be put in this slot.

	My #type variable contains a class.
"
Class {
	#name : #SingleType,
	#superclass : #AbstractTypeConstraint,
	#instVars : [
		'type'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
SingleType class >> initialSelector [
	^ #type:
]

{ #category : #accessing }
SingleType >> addType: aType [
	type = aType ifTrue:[ ^ self ].
	self becomeForward: ( { type. aType } asConstraint )
]

{ #category : #debug }
SingleType >> allTypes [
	^ { type } asSet
]

{ #category : #testing }
SingleType >> checkConstraint: anObject [
	((anObject isKindOf: type) or: [ anObject isNil ]) ifFalse: [ self wasViolatedBy: anObject ]
]

{ #category : #printing }
SingleType >> definitionStringOn: aStream [
	aStream 
		print: type
]

{ #category : #comparing }
SingleType >> hasSamePropertiesAs: anotherType [
	^ type = anotherType type
]

{ #category : #comparing }
SingleType >> hash [
	^ type hash
]

{ #category : #testing }
SingleType >> isSingleType [
	^ true
]

{ #category : #printing }
SingleType >> printOn: aStream [
	aStream print: self class;
		<< '(';
		print: type;
		<< ')'
]

{ #category : #accessing }
SingleType >> type [
	^ type
]

{ #category : #accessing }
SingleType >> type: aType [
	type := aType
]
