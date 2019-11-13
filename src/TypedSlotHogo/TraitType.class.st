Class {
	#name : #TraitType,
	#superclass : #AbstractType,
	#instVars : [
		'trait'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
TraitType class >> initialSelector [
	^#mustUse:
]

{ #category : #testing }
TraitType >> checkObjectType: anObject [
	(trait users includesAny: anObject class withAllSuperclasses)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #printing }
TraitType >> definitionStringOn: aStream [
	aStream print: trait 
]

{ #category : #testing }
TraitType >> hasSameTypeAs: aType [
	 ^ trait = aType trait
]

{ #category : #testing }
TraitType >> isTraitType [
	^ true
]

{ #category : #testing }
TraitType >> trait [
	^ trait
]

{ #category : #testing }
TraitType >> trait: aType [
	trait := aType
]
