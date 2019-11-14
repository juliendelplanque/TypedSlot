"
I represent Single type constraint.

	My #type variable contains a class.
"
Class {
	#name : #SingleType,
	#superclass : #AbstractType,
	#instVars : [
		'type'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
SingleType class >> initialSelector [
	^ #type:
]

{ #category : #typing }
SingleType >> checkObjectType: anObject [
	((anObject isKindOf: type) or: [ anObject isNil ]) ifFalse: [ self typeViolationWith: anObject ]
]

{ #category : #accessing }
SingleType >> definitionStringOn: aStream [
	aStream 
		print: type
]

{ #category : #comparing }
SingleType >> hasSameTypeAs: anotherType [
	^ type = anotherType type
]

{ #category : #testing }
SingleType >> isSingleType [
	^ true
]

{ #category : #accessing }
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
