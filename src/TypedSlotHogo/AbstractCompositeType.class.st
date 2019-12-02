"
I represent an abstract composite type.

I'm here for future composition types to subclass, that weren't foreseen.
"
Class {
	#name : #AbstractCompositeType,
	#superclass : #AbstractTypeConstraint,
	#category : #TypedSlotHogo
}

{ #category : #testing }
AbstractCompositeType >> isCompositeType [
	^ true
]
