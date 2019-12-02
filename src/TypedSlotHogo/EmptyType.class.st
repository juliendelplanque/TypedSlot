Class {
	#name : #EmptyType,
	#superclass : #AbstractType,
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
