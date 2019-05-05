Extension { #name : #BlockClosure }

{ #category : #'*TypedSlot-Block' }
BlockClosure >> checkObjectType: anObject [
	([ self value: anObject ] on: Error do: [ false ]) "In case of error during block evaluation, object is not valid for the slot."
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
