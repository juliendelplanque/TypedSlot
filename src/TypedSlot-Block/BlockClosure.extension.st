Extension { #name : #BlockClosure }

{ #category : #'*TypedSlot-Block' }
BlockClosure >> checkObjectType: anObject [
	(self value: anObject)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
