Class {
	#name : #EmptyType,
	#superclass : #AbstractTypeConstraint,
	#category : #TypedSlotHogo
}

{ #category : #debug }
EmptyType >> allTypes [
	^ Set new
]

{ #category : #debug }
EmptyType >> isEmptyType [
	^ true
]
