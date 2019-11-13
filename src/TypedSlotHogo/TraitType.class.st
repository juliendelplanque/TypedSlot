Class {
	#name : #TraitType,
	#superclass : #AbstractType,
	#instVars : [
		'type'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
TraitType class >> initialSelector [
	^#mustUse:
]

{ #category : #testing }
TraitType >> checkObjectType: anObject [
	(type users includesAny: anObject class withAllSuperclasses)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #printing }
TraitType >> definitionStringOn: aStream [
	aStream print: type 
]

{ #category : #testing }
TraitType >> hasSameTypeAs: aType [
	 ^ type = aType type
]

{ #category : #testing }
TraitType >> type [ 
	^ type
]

{ #category : #testing }
TraitType >> type: aType [
	type := aType
]
