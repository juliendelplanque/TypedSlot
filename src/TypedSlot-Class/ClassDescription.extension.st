Extension { #name : #ClassDescription }

{ #category : #'*TypedSlot-Class' }
ClassDescription >> checkConstraint: anObject [
	(anObject isKindOf: self)
		ifFalse: [ (ConstraintViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
