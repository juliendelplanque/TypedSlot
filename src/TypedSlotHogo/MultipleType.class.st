"
I represent a multiple types constraint.

	Try This!
	creation: #aMultipleTypeIV type: {SmallInteger. Float}
	either 1 or 1.5 could be put in that slot.
	
	my #types variables contains an array of types.
"
Class {
	#name : #MultipleType,
	#superclass : #AbstractTypeConstraint,
	#instVars : [
		'types'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
MultipleType class >> initialSelector [
	^ #type:
]

{ #category : #debug }
MultipleType >> addType: aType [
	types add: aType asTypeReification
]

{ #category : #debug }
MultipleType >> allTypes [
	^ (types flatCollect: [:aType| aType allTypes ]) asSet
]

{ #category : #testing }
MultipleType >> checkConstraint: anObject [
	((types anySatisfy: [:aType| anObject isKindOf: aType]) or: [ anObject isNil ]) ifFalse: [ self wasViolatedBy: anObject ]
]

{ #category : #printing }
MultipleType >> definitionStringOn: aStream [
	aStream nextPut: ${.
	types do: [:aType|
		aType definitionStringOn: aStream.
		]
	separatedBy:[ aStream nextPut: $. ].
	aStream nextPut: $}.
]

{ #category : #comparing }
MultipleType >> hasSamePropertiesAs: anotherType [
	^ types = anotherType types
]

{ #category : #comparing }
MultipleType >> hash [ 
	^ types hash
]

{ #category : #testing }
MultipleType >> isMultipleType [
	^ true
]

{ #category : #printing }
MultipleType >> printOn: aStream [
	aStream print: self class;
		<< '(';
		print: types;
		<< ')'
]

{ #category : #accessing }
MultipleType >> removeType: aType [
	types remove: aType asTypeReification.
	self singleTypeCheck
]

{ #category : #accessing }
MultipleType >> singleTypeCheck [
	types ifEmpty: [ ^ self becomeForward: EmptyType new ].
	types size = 1 ifTrue: [ ^ self becomeForward: self types anyOne ]"It's already a single type, no need to recreate it"
]

{ #category : #accessing }
MultipleType >> types [
	^ types
]

{ #category : #accessing }
MultipleType >> types: aCollectionOfType [
	self assert: aCollectionOfType isCollection.
	types := aCollectionOfType collect: #asConstraint into: Set new.
	self singleTypeCheck
]
