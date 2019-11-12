Extension { #name : #ClassDescription }

{ #category : #'*TypedSlot-Class' }
ClassDescription >> checkObjectType: anObject [
	(anObject isKindOf: self)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
