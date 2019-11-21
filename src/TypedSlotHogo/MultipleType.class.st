"
I represent a multiple types constraint.

	Try This!
	creation: #aMultipleTypeIV type: {SmallInteger. Float}
	either 1 or 1.5 could be put in that slot.
	
	my #types variables contains an array of types.
"
Class {
	#name : #MultipleType,
	#superclass : #AbstractType,
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
MultipleType >> allTypes [
	^ (types flatCollect: [:aType| aType allTypes ]) asSet
]

{ #category : #typing }
MultipleType >> checkObjectType: anObject [
	((types anySatisfy: [:aType| anObject isKindOf: aType]) or: [ anObject isNil ]) ifFalse: [ self typeViolationWith: anObject ]
]

{ #category : #accessing }
MultipleType >> definitionStringOn: aStream [
	aStream nextPut: ${.
	types do: [:aType|
		aType definitionStringOn: aStream.
		"aStream print: aType" ]
	separatedBy:[ aStream nextPut: $. ].
	aStream nextPut: $}.
]

{ #category : #testing }
MultipleType >> hasSameTypeAs: anotherType [
	^ types = anotherType types
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
MultipleType >> types [
	^ types
]

{ #category : #accessing }
MultipleType >> types: aType [
	self assert: aType isCollection.
	types := aType
]
