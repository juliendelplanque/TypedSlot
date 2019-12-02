"
I represent a Trait constraint for a typed slot.
I contraints values written inside the slot to use a specific trait.

	Try This!
	creation: #testSlot mustUse: MockTraitForTests
	The only Object currently using this trait is MockObjectUsingTrait, so only its instances could be inside that slot.

	my #trait instanceVariable contains a direct reference to a trait.
	
"
Class {
	#name : #TraitConstraint,
	#superclass : #AbstractConstraint,
	#instVars : [
		'trait'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
TraitConstraint class >> initialSelector [
	^#mustUse:
]

{ #category : #testing }
TraitConstraint >> checkConstraint: anObject [
	(trait users includesAny: anObject class withAllSuperclasses)
		ifFalse: [ (ConstraintViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #printing }
TraitConstraint >> definitionStringOn: aStream [
	aStream print: trait 
]

{ #category : #testing }
TraitConstraint >> hasSamePropertiesAs: aType [
	 ^ trait = aType trait
]

{ #category : #testing }
TraitConstraint >> isTraitType [
	^ true
]

{ #category : #testing }
TraitConstraint >> trait [
	^ trait
]

{ #category : #testing }
TraitConstraint >> trait: aType [
	trait := aType
]
