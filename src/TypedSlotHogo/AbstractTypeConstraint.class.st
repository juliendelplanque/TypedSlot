Class {
	#name : #AbstractTypeConstraint,
	#superclass : #AbstractConstraint,
	#category : #TypedSlotHogo
}

{ #category : #debug }
AbstractTypeConstraint >> allTypes [
	" It should return all types used. Only for debug purpose"
	^ self subclassResponsibility 
]